from fastapi import APIRouter, HTTPException, Depends
from pydantic import BaseModel
from typing import List
import asyncpg
from database import get_database_pool
from typing import Optional
from auth import authenticate_api_key

class GraphReport(BaseModel):
    report_id: int
    report_name: str
    graph_x_field: str
    graph_y_field: str
    x_data: Optional[List[str]] = None
    y_data: Optional[List[str]] = None
    
   
router = APIRouter()

@router.get("/api/graph_reports/", response_model=List[GraphReport])
async def get_graph_reports(user: str = Depends(authenticate_api_key)):
    """
    Retrieve all graph reports provided by the system.

    Returns:
        List[GraphReport]: A list of graph report provided by the system.
    
    Raises:
        HTTPException: If there is an internal server error.
    """
    try:
        # Connect to the database
        pool = await get_database_pool()
        async with pool.acquire() as conn:
        # Fetch list of items from the database
            items = await conn.fetch("SELECT * FROM pfb.get_graph_reports()")
            # Convert the list of items to a list of Item models
        reports_list = [GraphReport(report_id=item['report_id'], report_name=item['graph_name'], graph_x_field=item['graph_x_field'], graph_y_field=item['graph_y_field']) for item in items]
        return reports_list
    except Exception as e:
        error_message = f"Internal Server Error xxx: {str(e)}"
        raise HTTPException(status_code=500, detail=error_message)


@router.get("/api/graph_reports/{report_id}")
async def get_grant_application(report_id: int, user: str = Depends(authenticate_api_key)):
    """
    Retrieve a single graph report and report data by report ID.

    Args:
        report_id (int): The report ID of the graph report to retrieve.

    Returns:
        dict: The graph report data. This include the an array of x and y to be used on the graph report.

    Raises:
        HTTPException: If the grant application is not found or if there is an internal server error.
    """
    try:
        
        # Connect to the database
        pool = await get_database_pool()
        async with pool.acquire() as conn:
            # Fetch item from the database

            data_records = await conn.fetch("SELECT * From pfb.get_graph_data($1)", report_id)
            if data_records is None:
                raise HTTPException(status_code=404, detail="Graph data not found")
            # Extract x and y values from the records
            x_values = [record[0] for record in data_records]
            y_values = [record[1] for record in data_records]

            report_record = await conn.fetch("SELECT * From pfb.get_graph_report_by_id($1)", report_id)
            
            return {"report_id": report_id, "report_name": report_record[0]["graph_name"], "graph_x_field": report_record[0]["graph_x_field"], "graph_y_field": report_record[0]["graph_y_field"], "x_values": x_values, "y_values": y_values}
            #return dict(item_record[0])
    except Exception as e:
        error_message = f"Internal Server Error xxx: {str(e)}"
        raise HTTPException(status_code=500, detail=error_message)
