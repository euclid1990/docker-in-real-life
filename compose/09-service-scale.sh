#!/bin/bash

APP_PATH="./app"

echo "------ [BEGIN] Let's scale the [web] service ------"
docker service scale getstartedlab_web=4
echo "------ [END] Let's scale the [web] service ------\n"
