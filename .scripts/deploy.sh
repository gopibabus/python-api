#!/bin/bash

set -e

PYTHON_PATH=/usr/bin/python3
PIP_PATH=/usr/bin/pip
UVICORN_PATH=/usr/local/bin/uvicorn

echo "Deployment started ..."

# Enter maintenance mode or return true if already in maintenance mode
kill -SIGINT $(ps aux | grep uvicorn | grep -v grep | awk '{print $2}') || true

# Pull the latest version of the app
git fetch origin master
git reset --hard origin/master
git pull origin master

# Exit maintenance mode
$PYTHON_PATH $PIP_PATH $UVICORN_PATH main:app

echo "Deployment finished!"