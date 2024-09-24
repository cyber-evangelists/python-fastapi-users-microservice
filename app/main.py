from fastapi import FastAPI
from app.db.database import engine, Base
from app.api import user

Base.metadata.create_all(bind=engine)

app = FastAPI()

app.include_router(user.router, prefix="/users", tags=["users"])

@app.get("/")
def root():
    return {"message": "FastAPI Users Microservice"}
