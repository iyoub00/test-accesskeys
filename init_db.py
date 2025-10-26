import psycopg
import os
import time

def initialize_database():
    print("=== Database Initialization Starting ===")

    # Wait for RDS to be ready
    print("Waiting for database to be ready...")
    for i in range(30):
        try:
            conn = psycopg.connect(
                f"dbname=postgres user={os.getenv('DB_USER')} password={os.getenv('DB_PASS')} host={os.getenv('DB_HOST')} port={os.getenv('DB_PORT')}",
                connect_timeout=5
            )
            conn.close()
            print("✓ Database connection successful")
            break
        except Exception as e:
            print(f"Waiting for database... Attempt {i+1}/30: {str(e)[:50]}")
            time.sleep(2)
    else:
        print("✗ Failed to connect to database after 30 attempts")
        return

    # Create application database if it doesn't exist
    print("\n--- Creating Application Database ---")
    conn = psycopg.connect(
        f"dbname=postgres user={os.getenv('DB_USER')} password={os.getenv('DB_PASS')} host={os.getenv('DB_HOST')} port={os.getenv('DB_PORT')}"
    )
    conn.autocommit = True
    cursor = conn.cursor()

    try:
        cursor.execute("SELECT 1 FROM pg_database WHERE datname='silicon_talent_acquisition_app'")
        if cursor.fetchone():
            print("✓ Database 'silicon_talent_acquisition_app' already exists")
        else:
            print("Creating database 'silicon_talent_acquisition_app'...")
            cursor.execute("CREATE DATABASE silicon_talent_acquisition_app")
            print("✓ Database created successfully")
    except Exception as e:
        print(f"✗ Error checking/creating database: {e}")
    finally:
        conn.close()

    # Check if schemas are already initialized
    print("\n--- Checking Initialization Status ---")
    try:
        conn = psycopg.connect(
            f"dbname=silicon_talent_acquisition_app user={os.getenv('DB_USER')} password={os.getenv('DB_PASS')} host={os.getenv('DB_HOST')} port={os.getenv('DB_PORT')}"
        )
        cursor = conn.cursor()
        cursor.execute("SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'recruiter';")
        recruiter_tables = cursor.fetchone()[0]
        cursor.execute("SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'candidate';")
        candidate_tables = cursor.fetchone()[0]
        conn.close()

        if recruiter_tables > 0 or candidate_tables > 0:
            print(f"✓ Database already initialized (recruiter: {recruiter_tables} tables, candidate: {candidate_tables} tables)")
            print("Skipping initialization to preserve existing data")
            return
    except Exception as e:
        print(f"Database not initialized yet: {e}")

    # Initialize database schemas and data
    print("\n--- Running Database Initialization ---")
    print("Reading SQL files...")

    try:
        with open('/app/data/ddl.sql', 'r') as f:
            ddl = f.read()

        # Remove CREATE DATABASE line if present
        ddl_lines = ddl.split('\n')
        ddl = '\n'.join([line for line in ddl_lines if not line.strip().lower().startswith('create database')])

        with open('/app/data/init.sql', 'r') as f:
            init = f.read()

        print("✓ SQL files loaded")
    except Exception as e:
        print(f"✗ Error reading SQL files: {e}")
        return

    print("\nConnecting to application database...")
    conn = psycopg.connect(
        f"dbname=silicon_talent_acquisition_app user={os.getenv('DB_USER')} password={os.getenv('DB_PASS')} host={os.getenv('DB_HOST')} port={os.getenv('DB_PORT')}"
    )
    conn.autocommit = False
    cursor = conn.cursor()

    try:
        print("Executing DDL (schema creation)...")
        cursor.execute(ddl)
        conn.commit()
        print("✓ DDL executed successfully")

        print("Executing initial data population...")
        cursor.execute(init)
        conn.commit()
        print("✓ Initial data populated successfully")

        print("\n=== Database Initialization Complete ===")

    except Exception as e:
        print(f"\n✗ Error during initialization: {e}")
        conn.rollback()
        raise
    finally:
        conn.close()

if __name__ == "__main__":
    try:
        initialize_database()
    except Exception as e:
        print(f"\n✗ Fatal error: {e}")
        exit(1)