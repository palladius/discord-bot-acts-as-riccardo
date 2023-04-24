#!/bin/bash

PROJECT_ID=${1:-vulcanina}
VERSION=${2:-1.1}

set -x

cat .envrc.private | sed -e 's/export //' | sed -e 's/"//g' > .envrc.private.sanitized
docker run -it --env-file .envrc.private.sanitized gcr.io/"$PROJECT_ID"/discord-bot-docker:v$VERSION
