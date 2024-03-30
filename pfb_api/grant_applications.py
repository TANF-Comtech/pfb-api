from fastapi import APIRouter, HTTPException, Depends, Query
from pydantic import BaseModel
from typing import List
import asyncpg
from database import get_database_pool
from typing import Optional
from auth import authenticate_api_key

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


@router.get("/api/grant_applications/", response_model=List[GrantApplication])
async def get_grant_applications(user: str = Depends(authenticate_api_key)):
    """
    Retrieve all grant applications.

    Returns:
        List[GrantApplication]: A list of grant applications.
    
    Raises:
        HTTPException: If there is an internal server error.
    """
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
async def get_grant_application(case_id: int, user: str = Depends(authenticate_api_key)):
    """
    Retrieve a single grant application by case ID.

    Args:
        case_id (int): The case ID of the grant application to retrieve.

    Returns:
        dict: The grant application data.

    Raises:
        HTTPException: If the grant application is not found or if there is an internal server error.
    """
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
async def create_grant_application(item: GrantApplication, user: str = Depends(authenticate_api_key)):
    """
    Create a new grant application.

    Args:
        item (GrantApplication): The grant application data to create.

    Returns:
        dict: A message indicating the success of the operation. The case id will be returned as part of the message.

    Raises:
        HTTPException: If the grant application already exists or if there is an internal server error.
    """
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
async def update_grant_application(item: GrantApplication, user: str = Depends(authenticate_api_key)):
    """
    Update an existing grant application.

    Args:
        item (GrantApplication): The updated grant application data.

    Returns:
        dict: A message indicating the success of the operation. status code -1 is unsuccessful, 1 is successful.

    Raises:
        HTTPException: If the grant application does not exist or if there is an internal server error.
    """
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


@router.post("/api/grant_applications/search")
async def search_grant_applications_endpoint(
    status: Optional[str] = Query(None),
    decision: Optional[str] = Query(None),
    state: Optional[str] = Query(None),
    city: Optional[str] = Query(None),
    org_type: Optional[str] = Query(None)
    , user: str = Depends(authenticate_api_key)
) -> List[GrantApplication]:
    #return search_grant_applications(status, decision, state, city, org_type)
    try:
         # Connect to the database
        pool = await get_database_pool()
        async with pool.acquire() as conn:
        # Fetch list of items from the database
            # Construct the SQL query with dynamic parameters
            sql_query = """
                SELECT * FROM pfb.search_grant_applications($1, $2, $3, $4, $5)
            """
            # Execute the SQL query with the provided parameters
            items = await conn.fetch(sql_query, status, decision, state, city, org_type)

            # Transform fetched items into GrantApplication objects
            items_list = [
                GrantApplication(
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
                    status=item['status']
                ) for item in items
            ]

        return items_list
        
    except Exception as e:
        # Handle any exceptions
        raise HTTPException(status_code=500, detail=str(e))
    

@router.put("/api/grant_applications/process")
async def update_grant_application(
    case_id: Optional[int] = Query(None),
    approver: Optional[str] = Query(None),
    decision: Optional[str] = Query(None),
    status: Optional[str] = Query(None), user: str = Depends(authenticate_api_key)):
    """
    Process an existing grant application (approve, review or denied it)

    Args:
        item (GrantApplication): The process grant application data.

    Returns:
        dict: A message indicating the success of the operation. status code -1 is unsuccessful, 1 is successful.

    Raises:
        HTTPException: If the grant application does not exist or if there is an internal server error.
    """
    try:
         exe_status = -1 
        # Connect to the database
         pool = await get_database_pool()
         async with pool.acquire() as conn:
                # Insert data into the database
                try:
                  
                    exe_status = await conn.fetchval("""
                        SELECT pfb.process_grant_application(
                            $1, $2, $3, $4
                        )""", 
                        case_id,
                        approver,
                        decision
                        ,status
                    )
                except Exception as e:
                    error_message = f"Internal Server Error xxx: {str(e)}"
                    raise HTTPException(status_code=500, detail=error_message)
                return {"message": f"Grant application processed successfully with execution status : {exe_status}"}
    except Exception as e:
            error_message = f"Internal Server Error xxx: {str(e)}"
            raise HTTPException(status_code=500, detail=error_message)

