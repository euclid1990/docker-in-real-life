#!/bin/bash

APP_PATH="./app"

# Write a Compose file defines two services, web and redis
cat <<EOF >${APP_PATH}/docker-compose.yml
version: '2'
services:
  web:
    build: .
    image: euclid1990/simple-python-app
    ports:
     - "6969:5000"
    volumes:
     - .:/code
  redis:
    image: "redis:3.0.7"
EOF
