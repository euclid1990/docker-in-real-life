#!/bin/bash

# Remove mywordpressdb before creating
docker rm mywordpressdb -f

# Create and run mywordpressdb from mysql image
# This image exposes the standard MySQL port (3306)
docker run \
    --name=mywordpressdb \
    --network=mydefinednetwork \
    -e MYSQL_ROOT_PASSWORD=root_pwd \
    -e MYSQL_USER=db_user \
    -e MYSQL_PASSWORD=db_pwd \
    -e MYSQL_DATABASE=db_wordpress \
    mysql:5.7.18
