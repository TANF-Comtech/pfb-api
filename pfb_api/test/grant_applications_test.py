import pytest
from fastapi.testclient import TestClient
from grant_applications import router  # Assuming pfb_api is your module containing the router
from grant_applications import GrantApplication

# Fixture to create a test client for the API router
@pytest.fixture(scope="module")
def test_client():
    client = TestClient(router)
    yield client

# Unit test for the GET method to retrieve all grant applications
@pytest.mark.asyncio
async def test_get_grant_applications(test_client):
    response = await test_client.get("/api/grant_applications/")
    assert response.status_code == 200
    data = response.json()
    assert isinstance(data, list)
    assert all(isinstance(item, GrantApplication) for item in data)

# Unit test for the GET method to retrieve a single grant application by case_id
@pytest.mark.asyncio
async def test_get_grant_application(test_client):
    # Assuming case_id 1 exists in your test database
    response = await test_client.get("/api/grant_applications/1")
    assert response.status_code == 200
    data = response.json()
    assert isinstance(data, dict)  # Assuming you return a dictionary for a single item

# Unit test for the POST method to create a new grant application
@pytest.mark.asyncio
async def test_create_grant_application(test_client):
    new_grant_application_data = {
        "case_id": 1001,  # Update with appropriate data
        "org_name": "Test Organization",
        "org_address": "Test Address",
        "org_city": "Test City",
        "org_state": "TS",
        "org_zipcode": "39200-9299",
        "org_type": "Non-Profit Organization",
        "contact_name": "Test Contact Name",
        "contact_phone": "718-353-3020",
        "contact_email": "testemail@bqccommunitycenter.org",
        "purpose": "Test purpose statement.",
        "request_amount": 9900.0
    }
    response = await test_client.post("/api/grant_applications/", json=new_grant_application_data)
    assert response.status_code == 200
    assert response.json()["message"] == "Grant application created successfully"

# Unit test for the PUT method to update an existing grant application
@pytest.mark.asyncio
async def test_update_grant_application(test_client):
    updated_grant_application_data = {
        "case_id": 1,  # Update with appropriate case_id
        "org_name": "Test Organization",
        "org_address": "Test Address",
        "org_city": "Test City",
        "org_state": "TS",
        "org_zipcode": "39200-9299",
        "org_type": "Non-Profit Organization",
        "contact_name": "Test Contact Name",
        "contact_phone": "718-353-3020",
        "contact_email": "testemail@bqccommunitycenter.org",
        "purpose": "Test purpose statement.",
        "request_amount": 9900.0,
        "approver": "Test Approver",
        "decision": "Reviewing",
        "status": "Active"
    }
    response = await test_client.put("/api/grant_applications/", json=updated_grant_application_data)
    assert response.status_code == 200
    assert response.json()["message"] == "Grant application update successfully with execution status : 1"

