#!/bin/bash

docker inspect --format='{{ json .NetworkSettings.Networks }}'  mycontainer2 | python -m json.tool
