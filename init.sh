#!/bin/bash

# Start SSH service
service ssh start

# Start Flask app
python app.py
