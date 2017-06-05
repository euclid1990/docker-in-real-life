#!/bin/bash

# Start postgresql by root
service postgresql start

# Bundler all your dependencies
bundle check || bundle install

exec "$@"
