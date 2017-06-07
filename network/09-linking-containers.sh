#!/bin/bash

# Remove mycontainer4 before creating
docker rm mycontainer4 -f

# Containers connected to the default bridge network cannot resolve each other’s container name.
# If you need containers to be able to communicate with each other over the bridge network,
# you need to use the legacy [link] feature.
docker run -itd --name=mycontainer4 --link mycontainer1:c1 busybox

# Connect to the running mycontainer4
# Ping mycontainer1 by name
docker exec mycontainer4 \
    ping -w 4 mycontainer1
