#!/bin/bash

APP_PATH="./app"

echo "------ [BEGIN] List nodes in the swarm ------"
docker node ls
echo "------ [END] List nodes in the swarm ------\n"

echo "------ [BEGIN] Services associated with app ------"
# List the services associated with getstartedlab
docker stack services getstartedlab
echo "------ [END] Services associated with app ------\n"

echo "------ [BEGIN] Running containers associated with app ------"
# See a list of the containers you just launched:
docker stack ps getstartedlab
echo "------ [END] Running containers associated with app ------\n"

echo "------ [BEGIN] Get manager and work token to join swarm ------"
docker swarm join-token -q manager
docker swarm join-token -q worker
echo "------ [END] Get manager and work token to join swarm ------\n"
