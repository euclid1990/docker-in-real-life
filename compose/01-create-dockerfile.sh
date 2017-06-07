#!/bin/bash

APP_PATH="./app"

# Write a Dockerfile that builds a Docker image
cat <<EOF >${APP_PATH}/Dockerfile
FROM python:3.4-alpine
ADD . /code
WORKDIR /code
RUN pip install -r requirements.txt
CMD ["python", "app.py"]
EOF
