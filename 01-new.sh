#!/bin/bash

# Generating a New Rails Application
docker run --rm -v $(pwd)/rails-app:/project/app euclid1990/docker-meet-rails rails new . --force --database=postgresql -BT

