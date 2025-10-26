import psycopg
from psycopg.rows import dict_row

from kernel import DB_NAME, DB_USER, DB_PASS, DB_HOST, DB_PORT

database = psycopg.connect(f"dbname={DB_NAME} user={DB_USER} password={DB_PASS} host={DB_HOST} port={DB_PORT}", row_factory=dict_row)
database.autocommit = True