import asyncpg

async def get_database_pool():
    return await asyncpg.create_pool(
        user="pfb",
        password="xxxxxxxxxxxxxxxxx",
        database="postgres",
        host="localhost"
    )