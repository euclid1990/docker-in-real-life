#!/bin/bash

docker inspect --format='{{ json .NetworkSettings.Networks }}'  mycontainer3 | python -m json.tool
