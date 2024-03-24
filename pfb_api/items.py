from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
from typing import List
import asyncpg
from database import get_database_pool

class Item(BaseModel):
    item_id: int
    item_name: str
    description: str
    
   
router = APIRouter()

@router.get("/api/items/{item_id}")
async def get_item(item_id: int):
    try:
        
        # Connect to the database
        pool = await get_database_pool()
        async with pool.acquire() as conn:
            # Fetch item from the database
            item_record = await conn.fetchrow(
                "SELECT item_id, item_name, description FROM pfb.items WHERE item_id = $1",
                item_id
            )
            if item_record is None:
                raise HTTPException(status_code=404, detail="Item not found")
            return dict(item_record)
        #return {"message": ("item ", item_id)}
    except Exception as e:
        error_message = f"Internal Server Error xxx: {str(e)}"
        raise HTTPException(status_code=500, detail=error_message)


@router.post("/api/items/")
async def create_item(item: Item):
    try:
        # Connect to the database
         pool = await get_database_pool()
         async with pool.acquire() as conn:
                # Insert data into the database
                try:
                    # await conn.execute(
                    #     "INSERT INTO pfb.items (item_name, description) VALUES ($1, $2)",
                    #     item.item_name,
                    #     item.description
                    # )
                    await conn.execute("Select pfb.create_item($1, $2)", item.item_name, item.description)
                except asyncpg.exceptions.UniqueViolationError as e:
                    raise HTTPException(status_code=400, detail="Item with this name already exists")
                except Exception as e:
                    error_message = f"Internal Server Error xxx: {str(e)}"
                    raise HTTPException(status_code=500, detail=error_message)
                return {"message": "Item created successfully"}
    except Exception as e:
            error_message = f"Internal Server Error xxx: {str(e)}"
            raise HTTPException(status_code=500, detail=error_message)



# Endpoint to get a list of items
@router.get("/api/items/", response_model=List[Item])
async def get_items():
    try:
        # Connect to the database
        pool = await get_database_pool()
        async with pool.acquire() as conn:
        # Fetch list of items from the database
            # items = await conn.fetch(
            #   "SELECT item_id, item_name, description FROM pfb.items"
            # )
            items = await conn.fetch("SELECT * FROM pfb.get_items()")
            # Convert the list of items to a list of Item models
        items_list = [Item(item_id=item['item_id'], item_name=item['item_name'], description=item['description']) for item in items]
        return items_list
    except Exception as e:
        error_message = f"Internal Server Error xxx: {str(e)}"
        raise HTTPException(status_code=500, detail=error_message)
# Define more endpoints...
