#!/bin/bash

# Remove connection of mycontainer2 before connecting
docker network disconnect mynetwork mycontainer2

# Connect mycontainer2 to mynetwork
docker network connect mynetwork mycontainer2

# Verify the connection
docker network inspect mynetwork
