#!/bin/bash

#Show all children of docker, including namespace changes (-S): "$ pstree -apS $(pgrep dockerd)"
docker run --pid host --name namespaceC --rm \
    busybox:latest pstree $(pgrep dockerd)
