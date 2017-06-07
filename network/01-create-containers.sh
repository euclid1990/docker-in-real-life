#!/bin/bash

# Remove mycontainer1 and mycontainer2 before creating
docker rm mycontainer1 mycontainer2 -f

# Create and run mycontainer1
docker run -itd --name=mycontainer1 busybox

# Create and run mycontainer2
docker run -itd --name=mycontainer2 busybox
