#!/bin/bash

: '
 The command uses two flags on the run command: --interactive (or -i) and –-tty (or –t).
 First, the --interactive option tells Docker to keep the standard input stream (stdin) open for the container even if no terminal is attached.
 Second, the --tty option tells Docker to allocate a virtual terminal for the container, which will allow you to pass signals to the container.
 This is usually what you want from an interactive command-line program.
 You’ll usually use both of these when you’re running an interactive program like a shell in an interactive container.
'
docker exec -it myubuntu /bin/bash
