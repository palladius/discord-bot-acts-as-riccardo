#!/bin/bash

PROJECT_ID=${1:-vulcanina}
VERSION=${2:-2.1.1}

#set -x
set -e
set -u

echo Creating sanitized version
cat .envrc.private | sed -e 's/export //' | sed -e 's/"//g' | egrep -v '^#' > .envrc.private.sanitized

echo "🌱 PROJECT_ID: $PROJECT_ID"
echo "🌱 VERSION: $VERSION"
echo "🌱 APPLICATION_ID=$APPLICATION_ID"
echo "🌱 SERVER_ID=$SERVER_ID"
echo "🌱 DATABASE_URL=$DATABASE_URL,SERVER_ID=$SERVER_ID"

#docker run -it  gcr.io/"$PROJECT_ID"/discord-bot-docker:v$VERSION bash
docker run -it --env-file .envrc.private.sanitized gcr.io/"$PROJECT_ID"/discord-bot-docker:v$VERSION bash
