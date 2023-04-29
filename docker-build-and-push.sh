#!/bin/bash

PROJECT_ID=${1:-vulcanina}
DEFAULT_VERSION="$(cat VERSION)"
VERSION=${2:-$DEFAULT_VERSION}

#set -x
set -e
set -u

direnv allow

export REGION='us-central1'

if docker images | grep discord-bot-docker | grep "v$VERSION" ; then
    echo '🟨 no need to rebuild or repush'
else
    echodo docker build -t gcr.io/"$PROJECT_ID"/discord-bot-docker:v$VERSION .
    echo gcloud auth configure-docker
    echodo docker push "gcr.io/$PROJECT_ID/discord-bot-docker:v$VERSION"
fi
echo "🌱 PROJECT_ID: $PROJECT_ID"
echo "🌱VERSION: $VERSION"
echo "🌱APPLICATION_ID=$APPLICATION_ID"
echo "S🌱ERVER_ID=$SERVER_ID"
echo "🌱DATABASE_URL=$DATABASE_URL,SERVER_ID=$SERVER_ID"

echodo gcloud --project "$PROJECT_ID" run deploy discord-bot-docker \
    --image gcr.io/"$PROJECT_ID"/discord-bot-docker:v$VERSION \
    --update-env-vars "APPLICATION_ID=$APPLICATION_ID,SERVER_ID=$SERVER_ID,DATABASE_URL=$DATABASE_URL" \
    --region "$REGION" \
    --allow-unauthenticated \
    --platform managed

echo Try: now:

# locally: docker run -it -p 8087:8080 --env-file ~/git/discord-bot-acts-as-riccardo/.envrc.private gcr.io/vulcanina/discord-bot-docker:v1.1
