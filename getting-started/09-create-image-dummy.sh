#!/bin/bash

docker export myubuntu > ./myubuntu.tar

# cat ubuntu.tar | docker import - myubuntuimage:latest
