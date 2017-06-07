#!/bin/bash

# Remove mynetwork before creating
docker network rm mydefinednetwork

# Create mynetwork
docker network create --subnet=172.26.0.0/16 mydefinednetwork
