#!/bin/bash

# Remove mywordpress before creating
docker rm mywordpress -f

# Create and run mywordpress
docker run \
    --name=mywordpress \
    --network=mydefinednetwork \
    -p 3000:80 \
    -e WORDPRESS_DB_HOST=mywordpressdb:3306 \
    -e WORDPRESS_DB_USER=db_user \
    -e WORDPRESS_DB_PASSWORD=db_pwd \
    -e WORDPRESS_DB_NAME=db_wordpress \
    wordpress:4.7.5-apache
