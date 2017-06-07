#!/bin/bash

# Connect to the running mycontainer3
# Ping mycontainer2 by name
docker exec mycontainer3 \
    ping -w 4 mycontainer2

# Connect to the running mycontainer3
# Ping mycontainer1 by IP Address
docker exec mycontainer3 \
    ping -w 4 172.17.0.2
