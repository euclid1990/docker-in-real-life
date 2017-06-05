#!/bin/bash

docker run \
    -ti \
    --name=myubuntu \
    --volume=$(pwd):/my-data \
    --workdir=/my-data \
    ubuntu:14.04 \
    /bin/bash

