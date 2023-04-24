#!/bin/bash

PROJECT_ID=${1:-vulcanina}
VERSION=${2:-1.1}

set -x

docker build -t gcr.io/"$PROJECT_ID"/discord-bot-docker:v$VERSION .

#docker push gcr.io/"$PROJECT_ID"/discord-bot-docker:v$VERSION
gcloud run deploy discord-bot-docker --image gcr.io/"$PROJECT_ID"/discord-bot-docker:v$VERSION --platform managed

echo Try:
#cat .envrc.private | sed -e 's/export //' | sed -e 's/"//g' > .envrc.private.sanitized
#docker run -it --env-file .envrc.private.sanitized gcr.io/"$PROJECT_ID"/discord-bot-docker:v$VERSION
