from fastapi import FastAPI, HTTPException, Depends, Header, APIRouter
from typing import Optional


#router = APIRouter()
# Hardcoded API keys for demonstration purposes, 
# For production enviornment, the API_KEYS can be stored in the evironment variables.
API_KEYS = {
    "SKSDF#ksdfl2843sKSDFK*6": "User",
    "JKJS93893KSDGJ932jsdg$3": "Approver"
}

# Custom dependency for API key authentication
async def authenticate_api_key(api_key: Optional[str] = Header(None)):
    #api_key = "key1"
    # print("API Key received:", api_key)
    # return {"message": f"Welcome, {api_key}"}
    if api_key is None or api_key not in API_KEYS:
        raise HTTPException(status_code=401, detail=("Invalid API Key",api_key))
    return api_key



