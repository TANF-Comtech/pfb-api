import pytest
from fastapi.testclient import TestClient
from grant_files import router  
from grant_files import GrantFile

client = TestClient(router)


@pytest.mark.asyncio
async def test_get_grant_files():
    response = await client.get("/api/grant_files")
    assert response.status_code == 200
    files = response.json()
    assert isinstance(files, list)
    assert all(isinstance(file, GrantFile) for file in files)


@pytest.mark.asyncio
async def test_get_grant_files_by_case_id():
    response = await client.get("/api/grant_files/1")
    assert response.status_code == 200
    files = response.json()
    assert isinstance(files, list)
    assert all(isinstance(file, GrantFile) for file in files)


@pytest.mark.asyncio
async def test_insert_grant_file():
    file_data = {
        "case_id": 123,
        "file_name": "example.txt",
        "file_path": "/path/to/file",
        "created_by": "user",
        "file_creation_date": "2024-03-24T00:00:00"
    }
    response = await client.post("/api/grant_files/", json=file_data)
    assert response.status_code == 200
    assert response.json() == {"message": "Grant file inserted successfully"}
    


# Run the tests
if __name__ == "__main__":
    pytest.main()
