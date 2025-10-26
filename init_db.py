import psycopg
import os
import time

def initialize_database():
    print("Database Initialization")

    # Wait for database
    for i in range(30):
        try:
            conn = psycopg.connect(
                f"dbname=postgres user={os.getenv('DB_USER')} password={os.getenv('DB_PASS')} host={os.getenv('DB_HOST')} port={os.getenv('DB_PORT')}",
                connect_timeout=5
            )
            conn.close()
            print(" Database connected")
            break
        except:
            print(f"Waiting for database... ({i+1}/30)")
            time.sleep(2)

    # Check if already initialized
    try:
        conn = psycopg.connect(
            f"dbname=postgres user={os.getenv('DB_USER')} password={os.getenv('DB_PASS')} host={os.getenv('DB_HOST')} port={os.getenv('DB_PORT')}"
        )
        cursor = conn.cursor()
        cursor.execute("SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'public';")
        if cursor.fetchone()[0] > 0:
            print("✓ Database already initialized")
            conn.close()
            return
        conn.close()
    except:
        pass

    # Initialize database
    print("Initializing database...")

    # Read DDL
    with open('/app/data/ddl.sql', 'r') as f:
        ddl = f.read()

    # Read init
    with open('/app/data/init.sql', 'r') as f:
        init = f.read()

    conn = psycopg.connect(
        f"dbname=postgres user={os.getenv('DB_USER')} password={os.getenv('DB_PASS')} host={os.getenv('DB_HOST')} port={os.getenv('DB_PORT')}"
    )
    conn.autocommit = False
    cursor = conn.cursor()

    cursor.execute(ddl)
    conn.commit()
    print(" DDL executed")

    cursor.execute(init)
    conn.commit()
    print(" Init executed")

    conn.close()
    print(" Database ready")

if __name__ == "__main__":
    initialize_database()