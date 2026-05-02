import duckdb

con = duckdb.connect("dev.duckdb")

con.execute("""
    CREATE OR REPLACE TABLE raw_taxi_trips AS
    SELECT * FROM read_parquet('seeds/yellow_tripdata_2024_01.parquet')
""")

count = con.execute("SELECT COUNT(*) FROM raw_taxi_trips").fetchone()[0]
print(f"Loaded {count:,} trips in DuckDB")

con.close()