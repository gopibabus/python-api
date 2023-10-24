#!/bin/bash

set -e

PYTHON_PATH=/usr/bin/python3
PIP_PATH=/usr/bin/pip

echo "Deployment started ..."

# Enter maintenance mode or return true if already in maintenance mode
pkill -INT -f uvicorn || true

# Pull the latest version of the app
git fetch origin master
git reset --hard origin/master
git pull origin master

# Exit maintenance mode
$PYTHON_PATH -m uvicorn main:app --host 0.0.0.0 --port 8000 &

echo "Deployment finished!"