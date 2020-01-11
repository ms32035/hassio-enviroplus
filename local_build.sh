#!/bin/bash

arch=$(uname -m)

case $arch in
armv7l)
  docker_arch=armv7
  ;;
x86_64)
  docker_arch=amd64
  ;;
esac

docker build \
--build-arg BUILD_FROM="homeassistant/${docker_arch}-base:latest" \
-t local/enviroplus2mqtt \
enviroplus2mqtt
