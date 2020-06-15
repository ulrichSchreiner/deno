#!/bin/bash

# use this script to build a local "latest" version with the version from the drone spec

VERSION=$(cat .drone.yml |grep DENO_VERSION | cut -d":" -f2)

docker build -t ulrichschreiner/deno --build-arg "DENO_VERSION=${VERSION//[[:space:]]/}" .
