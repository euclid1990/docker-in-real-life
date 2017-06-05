#!/bin/bash

docker pull appropriate/curl

docker run \
    -ti \
    --rm \
    --name=curl \
    --volume=/var/run/docker.sock:/var/run/docker.sock:rw \
    appropriate/curl \
    sh -c "curl --unix-socket /var/run/docker.sock -H \"Content-Type: application/json\" -X GET http:/v1.24/containers/json"
