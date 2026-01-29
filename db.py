import os
import psycopg2

conn = psycopg2.connect(
    dbname="sql_agent_db",
    user="postgres",
    password=os.getenv("DB_PASSWORD"),
    host="localhost",
    port="5432"
)

def run_query(query: str):
    with conn.cursor() as cur:
        cur.execute(query)
        try:
            return cur.fetchall()
        except:
            return "Query executed"
