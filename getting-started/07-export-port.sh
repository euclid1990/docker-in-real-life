#!/bin/bash

docker run --rm --name mynginx -v $(pwd)/nginx-html:/usr/share/nginx/html -p 6969:80 nginx

# docker run --rm --name mynginx -v $(pwd)/nginx-html:/usr/share/nginx/html -p 6969:80 nginx
