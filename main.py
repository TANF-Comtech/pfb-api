from fastapi import FastAPI

app = FastAPI()
# Import other API routers
from pfb_api import graph_reports, items, grant_applications, grant_files
app.include_router(graph_reports.router)
app.include_router(items.router)
app.include_router(grant_applications.router)
app.include_router(grant_files.router)
#app.include_router(auth.router)
    
@app.get("/")
def read_root():
    return {"message": "Welcome to PBF API"}