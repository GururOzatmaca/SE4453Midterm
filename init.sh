#!/bin/bash

# Start SSH service
service ssh start

# Start Python web app (adjust if different)
# For example, FastAPI with Uvicorn:
uvicorn app:app --host 0.0.0.0 --port 8000

