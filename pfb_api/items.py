from fastapi import APIRouter, HTTPException, Depends
from pydantic import BaseModel
from typing import List
import asyncpg
from database import get_database_pool
from auth import authenticate_api_key

class Item(BaseModel):
    item_id: int
    item_name: str
    description: str
    
   
router = APIRouter()

# Endpoint to get a list of items
@router.get("/api/items/", response_model=List[Item])
async def get_items(user: str = Depends(authenticate_api_key)):
    """
    Retrieve all items.

    Returns:
        List[Item]: A list of items.
    
    Raises:
        HTTPException: If there is an internal server error.
    """
    try:
        # Connect to the database
        pool = await get_database_pool()
        async with pool.acquire() as conn:
        # Fetch list of items from the database
            items = await conn.fetch("SELECT * FROM pfb.get_items()")
            # Convert the list of items to a list of Item models
        items_list = [Item(item_id=item['item_id'], item_name=item['item_name'], description=item['description']) for item in items]
        return items_list
    except Exception as e:
        error_message = f"Internal Server Error xxx: {str(e)}"
        raise HTTPException(status_code=500, detail=error_message)
 
# Endpoint to get an item record
@router.get("/api/items/{item_id}")
async def get_item(item_id: int, user: str = Depends(authenticate_api_key)):
    """
    Retrieve a single item by item ID.

    Args:
        item_id (int): The item ID of the item to retrieve.

    Returns:
        dict: The item data.

    Raises:
        HTTPException: If the grant application is not found or if there is an internal server error.
    """
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
async def create_item(item: Item, user: str = Depends(authenticate_api_key)):
    """
    Create a new item.

    Args:
        item (Item): The item data to create.

    Returns:
        dict: A message indicating the success of the operation.

    Raises:
        HTTPException: If the item already exists or if there is an internal server error.
    """
    try:
        # Connect to the database
         pool = await get_database_pool()
         async with pool.acquire() as conn:
                # Insert data into the database
                try:
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





# Define more endpoints...
