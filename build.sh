#!/usr/bin/env bash

docker build --no-cache --platform linux/amd64 . -t test
docker run --rm --platform linux/amd64 test /src/bin/linux/mqtest
