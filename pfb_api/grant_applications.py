from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
from typing import List
import asyncpg
from database import get_database_pool
from typing import Optional

class GrantApplication(BaseModel):
    case_id: int
    org_name: str
    org_address: str
    org_city: str
    org_state: str
    org_zipcode: str
    org_type: str
    contact_name: str
    contact_phone: str
    contact_email: str
    purpose: str
    request_amount: float
    approver: Optional[str] = None
    decision: Optional[str] = None
    status: Optional[str] = None

    
   
router = APIRouter()

# @router.get("/api/grant_application")
# def get():
#     return {"message": "Grant Application 6"}

@router.get("/api/grant_applications/", response_model=List[GrantApplication])
async def get_grant_applications():
    try:
        # Connect to the database
        pool = await get_database_pool()
        async with pool.acquire() as conn:
        # Fetch list of items from the database
            # items = await conn.fetch(
            #   "SELECT item_id, item_name, description FROM pfb.items"
            # )
            items = await conn.fetch("SELECT * FROM pfb.get_grant_applications()")
            # Convert the list of items to a list of Item models
        items_list = [GrantApplication(
            case_id=item['case_id'], 
            org_name=item['org_name'], 
            org_address=item['org_address'],
            org_city=item['org_city'],
            org_state=item['org_state'],
            org_zipcode=item['org_zipcode'],
            org_type=item['org_type'],
            contact_name=item['contact_name'],
            contact_phone=item['contact_phone'],
            contact_email=item['contact_email'],
            purpose=item['purpose'],
            request_amount=item['request_amount'],
            approver=item['approver'],
            decision=item['decision'],
            status=item['status'],
            ) for item in items]
        return items_list
    except Exception as e:
        error_message = f"Internal Server Error xxx: {str(e)}"
        raise HTTPException(status_code=500, detail=error_message)
    

@router.get("/api/grant_applications/{case_id}")
async def get_grant_application(case_id: int):
    try:
        
        # Connect to the database
        pool = await get_database_pool()
        async with pool.acquire() as conn:
            # Fetch item from the database

            item_record = await conn.fetch("SELECT * From pfb.get_grant_application_by_id($1)", case_id)
            if item_record is None:
                raise HTTPException(status_code=404, detail="Item not found")
            return dict(item_record[0])
        #return {"message": ("item ", item_id)}
    except Exception as e:
        error_message = f"Internal Server Error xxx: {str(e)}"
        raise HTTPException(status_code=500, detail=error_message)


@router.post("/api/grant_applications/")
async def create_grant_application(item: GrantApplication):
    try:
         inserted_id = -1 
        # Connect to the database
         pool = await get_database_pool()
         async with pool.acquire() as conn:
                # Insert data into the database
                try:
                  
                    inserted_id = await conn.fetchval("""
                        SELECT pfb.insert_grant_application(
                            $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11
                        )""", 
                        item.org_name,
                        item.org_address,
                        item.org_city,
                        item.org_state,
                        item.org_zipcode,
                        item.org_type,
                        item.contact_name,
                        item.contact_phone,
                        item.contact_email,
                        item.purpose,
                        item.request_amount
                    )
                except asyncpg.exceptions.UniqueViolationError as e:
                    raise HTTPException(status_code=400, detail="Item with this name already exists")
                except Exception as e:
                    error_message = f"Internal Server Error xxx: {str(e)}"
                    raise HTTPException(status_code=500, detail=error_message)
                return {"message": f"Grant application created with case id : {inserted_id}"}
    except Exception as e:
            error_message = f"Internal Server Error xxx: {str(e)}"
            raise HTTPException(status_code=500, detail=error_message)

@router.put("/api/grant_applications/")
async def update_grant_application(item: GrantApplication):
    try:
         status = -1 
        # Connect to the database
         pool = await get_database_pool()
         async with pool.acquire() as conn:
                # Insert data into the database
                try:
                  
                    status = await conn.fetchval("""
                        SELECT pfb.update_grant_application(
                            $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15
                        )""", 
                        item.case_id,
                        item.org_name,
                        item.org_address,
                        item.org_city,
                        item.org_state,
                        item.org_zipcode,
                        item.org_type,
                        item.contact_name,
                        item.contact_phone,
                        item.contact_email,
                        item.purpose,
                        item.request_amount,
                        item.approver,
                        item.decision,
                        item.status
                    )
                except Exception as e:
                    error_message = f"Internal Server Error xxx: {str(e)}"
                    raise HTTPException(status_code=500, detail=error_message)
                return {"message": f"Grant application update successfully with execution status : {status}"}
    except Exception as e:
            error_message = f"Internal Server Error xxx: {str(e)}"
            raise HTTPException(status_code=500, detail=error_message)


