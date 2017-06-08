#!/bin/bash

APP_PATH="./app"

# Write a Compose file defines two services, web and redis
# Instruct web’s containers to share port 6969 via a load-balanced network called "webnet"
# Internally, the containers themselves will publish to web’s port 5000 at an ephemeral port.)
# Define the webnet network with the default settings (which is a load-balanced overlay network).
# The `depends_on` option is ignored when deploying a stack in swarm mode with a version 3 Compose file.
cat <<EOF >${APP_PATH}/docker-compose.yml
version: "3"

services:
  web:
    image: euclid1990/simple-python-app
    deploy:
      replicas: 3
      resources:
        limits:
          cpus: "0.1"
          memory: 50M
      restart_policy:
        condition: on-failure
    ports:
      - "6969:5000"
    networks:
      - webnet
    volumes:
      - .:/code
    command: ["./wait-for-it.sh", "redis:6379", "--", "python", "app.py"]

  redis:
    image: "redis:3.0.7"
    networks:
      - webnet

  visualizer:
    image: dockersamples/visualizer:stable
    ports:
      - "9696:8080"
    volumes:
      - "/var/run/docker.sock:/var/run/docker.sock"
    deploy:
      placement:
        constraints: [node.role == manager]
    networks:
      - webnet

networks:
  webnet:
EOF

echo "------ [BEGIN] Init swarm ------"
# Initialize a swarm
docker swarm leave -f
docker swarm init
echo "------ [END] Init swarm ------\n"

echo "------ [BEGIN] Scale the app ------"
# Scale the app
cd $APP_PATH/ && docker stack deploy -c docker-compose.yml getstartedlab
echo "------ [END] Scale the app ------\n"

