#!/bin/bash

# Remove all untagged images
docker rmi $(docker images -f "dangling=true" -q)
