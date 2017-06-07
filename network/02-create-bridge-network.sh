#!/bin/bash

# Remove mynetwork before creating
docker network rm mynetwork

# Create mynetwork
docker network create --subnet=172.25.0.0/16 mynetwork

# List all network of docker containers
docker network ls

# Inspect created mynetwork
docker network inspect mynetwork
