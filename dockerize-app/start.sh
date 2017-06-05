#!/bin/bash

docker run --name dockerizingnode -p 3000:3000 -v $(pwd):/project/app euclid1990/docker-meet-node
