#!/bin/bash

# Connect to the running mycontainer2
# Ping mycontainer3 by name
docker exec mycontainer2 \
    ping -w 4 mycontainer3

# Connect to the running mycontainer2
# Ping mycontainer1 by name
#
# This functionality is not available for the default bridge network.
# Both container1 and container2 are connected to the bridge network,
# but you cannot ping container1 from container2 using the container name.
docker exec mycontainer2 \
    ping -w 4 mycontainer1

# You can still ping the IP address directly
docker exec mycontainer2 \
    ping -w 4 172.17.0.2
