#!/bin/bash

APP_PATH="./app"

echo "------ [BEGIN] Tear down app ------"

docker stack rm getstartedlab

docker swarm leave -f

# Remove containers have name started with `getstartedlab`
docker ps -a -f "name=getstartedlab" --format "{{.ID}}" | xargs docker rm

echo "------ [END] Tear down app ------\n"
