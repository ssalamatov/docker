#!/bin/bash
set -euo pipefail

DOCKER_TAG="docker-python"

docker build --tag="${DOCKER_TAG}" ".docker"
docker run \
        -u "$(id -u)" \
        --rm -v "$(pwd):/mnt" \
        -w /mnt \
        -e BUILD_NUMBER \
        -t "${DOCKER_TAG}" ./create.sh "$@"
