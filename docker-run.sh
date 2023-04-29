#!/bin/bash

PROJECT_ID=${1:-vulcanina}
DEFAULT_VERSION="$(cat VERSION)"
VERSION=${2:-$DEFAULT_VERSION}
#set -x
set -e
set -u

if docker images | grep discord-bot-docker | grep "v$VERSION" ; then
    echo '🟨 no need to rebuild or repush'
else
    ./docker-build-and-push.sh
fi

echo Creating sanitized version
cat .envrc.private | sed -e 's/export //' | sed -e 's/"//g' | egrep -v '^#' > .envrc.private.sanitized

bin/show-needed-envs.sh


#docker run -it  gcr.io/"$PROJECT_ID"/discord-bot-docker:v$VERSION bash
docker run -it --env-file .envrc.private.sanitized gcr.io/"$PROJECT_ID"/discord-bot-docker:v$VERSION
#docker run -it --env-file .envrc.private.sanitized gcr.io/"$PROJECT_ID"/discord-bot-docker:v$VERSION bash
