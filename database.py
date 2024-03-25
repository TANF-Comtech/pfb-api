import asyncpg

async def get_database_pool():
    return await asyncpg.create_pool(
        user="pfb",
        password="p@f_b28SKi#89",
        database="postgres",
        host="localhost"
    )