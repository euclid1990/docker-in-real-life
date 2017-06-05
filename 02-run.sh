#!/bin/bash

# Bundle install gem
docker run --name dockerizingrails -p 3000:3000 -v $(pwd)/rails-app:/project/app euclid1990/docker-meet-rails
