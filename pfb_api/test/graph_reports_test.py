import pytest
from fastapi.testclient import TestClient
from graph_reports import router
from graph_reports import GraphReport
# from pfb_api import graph_reports, items, grant_applications, grant_files
# app.include_router(graph_reports.router)

@pytest.fixture(scope="module")
def test_client():
    client = TestClient(router)
    yield client

@pytest.mark.asyncio
async def test_get_graph_reports(test_client):
    response = await test_client.get("/api/graph_reports/")
    assert response.status_code == 200
    reports = response.json()
    assert isinstance(reports, list)
    assert all(isinstance(report, GraphReport) for report in reports)

@pytest.mark.asyncio
async def test_get_grant_application(test_client):
    # Assuming report_id 1 exists in your test database
    response = await test_client.get("/api/graph_reports/1")
    assert response.status_code == 200
    data = response.json()
    assert "report_id" in data
    assert "report_name" in data
    assert "graph_x_field" in data
    assert "graph_y_field" in data
    assert "x_values" in data
    assert "y_values" in data
