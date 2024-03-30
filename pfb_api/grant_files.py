from fastapi import APIRouter, HTTPException, Depends
from pydantic import BaseModel
from typing import List
import asyncpg
from database import get_database_pool
from typing import Optional
from datetime import datetime
from auth import authenticate_api_key

class GrantFile(BaseModel):
    case_id: int
    file_name: str
    file_path: str
    created_by: str
    file_creation_date: datetime
    
   
router = APIRouter()

@router.get("/api/grant_files", response_model=List[GrantFile])
async def get_grant_files(user: str = Depends(authenticate_api_key)):
    """
    Retrieve all grant files for all grant applications.

    Returns:
        List[GrantFile]: A list of grant files for all grant applications.
    
    Raises:
        HTTPException: If there is an internal server error.
    """
    try:
        # Connect to the database
        pool = await get_database_pool()
        async with pool.acquire() as conn:
        # Fetch list of items from the database
            files = await conn.fetch("SELECT * FROM pfb.get_grant_files()")
            # Convert the list of items to a list of Item models
        files_list = [GrantFile(case_id=item['case_id'], file_name=item['file_name'], file_path=item['file_path'], file_creation_date=item['file_creation_date'], created_by=item['created_by']) for item in files]
        return files_list
    except Exception as e:
        error_message = f"Internal Server Error xxx: {str(e)}"
        raise HTTPException(status_code=500, detail=error_message)


@router.get("/api/grant_files/{case_id}", response_model=List[GrantFile])
async def get_grant_files(case_id: int, user: str = Depends(authenticate_api_key)):
    """
    Retrieve all grant files for a grant application by case id.

    Returns:
        List[GrantFile]: A list of grant files for a grant applications.
    
    Raises:
        HTTPException: If there is an internal server error.
    """
    try:
        # Connect to the database
        pool = await get_database_pool()
        async with pool.acquire() as conn:
        # Fetch list of items from the database
            files = await conn.fetch("SELECT * FROM pfb.get_grant_files_by_case_id($1)", case_id)
            # Convert the list of items to a list of Item models
        files_list = [GrantFile(case_id=item['case_id'], file_name=item['file_name'], file_path=item['file_path'], file_creation_date=item['file_creation_date'], created_by=item['created_by']) for item in files]
        return files_list
    except Exception as e:
        error_message = f"Internal Server Error xxx: {str(e)}"
        raise HTTPException(status_code=500, detail=error_message)


@router.post("/api/grant_files/")
async def insert_grant_file(file: GrantFile, user: str = Depends(authenticate_api_key)):
    """
    Insert a grant file record.

    Args:
        item (GrantFile): The grant file to be inserted.

    Returns:
        dict: A message indicating the success of the operation.

    Raises:
        HTTPException: If the grant file already exists or if there is an internal server error.
    """
    try:
        # Connect to the database
         pool = await get_database_pool()
         async with pool.acquire() as conn:
                # Insert data into the database
                try:
                    await conn.execute("Select pfb.insert_grant_files($1, $2, $3, $4)", file.case_id, file.file_name, file.file_path, file.created_by)
                except asyncpg.exceptions.UniqueViolationError as e:
                    raise HTTPException(status_code=400, detail="File with this name already exists")
                except Exception as e:
                    error_message = f"Internal Server Error xxx: {str(e)}"
                    raise HTTPException(status_code=500, detail=error_message)
                return {"message": "Grant file inserted successfully"}
    except Exception as e:
            error_message = f"Internal Server Error xxx: {str(e)}"
            raise HTTPException(status_code=500, detail=error_message)