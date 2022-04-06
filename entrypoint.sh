#! /usr/bin/env sh
set -e 
if [ -z "$1" ]; then
    mkdocs --help
elif [[ "$1" == "produce" ]]; then
    mkdocs new .
    mkdocs build
    tar -C /projects -czf site.tar.gz .
elif [[ "$1" == "serve" ]]; then
    #switching stdin to point to produced tar content
    shift
    tar -xvf site.tar.gz 
    # using the -a flag to bind mkdocs to docker output
    mkdocs serve -a 0.0.0.0:8000
else 
    exec "$@"
fi