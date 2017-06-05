#!/bin/bash

# Creating a PID namespace for each container is a critical feature of Docker.
docker run -d --name namespaceA --rm \
    busybox:latest /bin/sh -c "sleep 30000"
docker run -d --name namespaceB --rm \
    busybox:latest /bin/sh -c "nc -l -p 0.0.0.0:80"

# Process list of container [namespaceA]
docker exec namespaceA ps

# Process list of container [namespaceB]
docker exec namespaceB ps

# Process list of host machine
docker run --pid host --name namespaceC --rm \
    busybox:latest ps
