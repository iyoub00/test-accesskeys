import os

DB_NAME = os.getenv("DB_NAME", "postgres")
DB_HOST = os.getenv("DB_HOST", "localhost")
DB_USER = os.getenv("DB_USER", "root")
DB_PASS = os.getenv("DB_PASS", "toor")
DB_PORT = os.getenv("DB_PORT", 5432)

BUCKET_NAME = os.getenv("BUCKET_NAME", "silicon-talent-acquisition-agent")

LOG_GROUP_NAME = os.getenv("LOG_GROUP_NAME", "silicon-talent-acquisition-agent")
LOG_STREAM_NAME_CANDIDATE = os.getenv("LOG_STREAM_NAME_CANDIDATE", "silicon-talent-acquisition-agent-candidate")
LOG_STREAM_NAME_RECRUITER = os.getenv("LOG_STREAM_NAME_RECRUITER", "silicon-talent-acquisition-agent-recruiter")
LOG_STREAM_NAME_SYSTEM = os.getenv("LOG_STREAM_NAME_SYSTEM", "silicon-talent-acquisition-agent-system")