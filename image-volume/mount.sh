#!/bin/bash

docker rm myubuntu_volume

docker run --name myubuntu_volume --volume $(pwd):/my-data --workdir=/my-data ubuntu:14.04

docker inspect -f '{{ json .Mounts }}' myubuntu_volume | python -m json.tool
