from recommendation import recommend_data
from typing import Union

from fastapi import FastAPI
app = FastAPI()


@app.get("/")
def read_root(user_profle):
    jobs = recommend_data(user_profle)
    return {"data": jobs}

