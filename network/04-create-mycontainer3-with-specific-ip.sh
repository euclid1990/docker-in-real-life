#!/bin/bash

# Remove mycontainer3 before creating
docker rm mycontainer3

# Start a third container, but this time assign it an IP address using the --ip flag and connect it to the mynetwork
docker run --network=mynetwork --ip=172.25.3.3 -itd --name=mycontainer3 busybox
