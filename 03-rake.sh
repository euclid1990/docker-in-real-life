#!/bin/bash

# Create database
docker exec dockerizingrails rake db:create

# Migrate database
docker exec dockerizingrails rake db:migrate
