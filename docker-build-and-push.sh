#!/bin/bash

PROJECT_ID=${1:-vulcanina}
DEFAULT_VERSION="$(cat VERSION)"
VERSION=${2:-$DEFAULT_VERSION}

#set -x
set -e
set -u

direnv allow

ARTIFACT_REPO_URL="us-central1-docker.pkg.dev/vulcanina/discord-bot"

#export REGION="$GCP_REGION"

# since docker doesnt work with this
cp .envrc.private .envrc.private.copynosymlink

if docker images | grep discord-bot-docker | grep "v$VERSION" ; then
    echo '🟨 no need to rebuild or repush'
else
#    echodo docker build -t gcr.io/"$PROJECT_ID"/discord-bot-docker:v$VERSION .
    echodo docker build -t $ARTIFACT_REPO_URL/discord-bot-docker:v$VERSION .
    echo gcloud auth configure-docker
#    echodo docker push "gcr.io/$PROJECT_ID/discord-bot-docker:v$VERSION"
    echodo docker push $ARTIFACT_REPO_URL/discord-bot-docker:v$VERSION
fi

 bin/show-needed-envs.sh

# echo "🌱 PROJECT_ID: $PROJECT_ID"
# echo "🌱 VERSION: $VERSION"
# #echo "🌱 APPLICATION_ID=$APPLICATION_ID"
# echo "🌱 SERVER_ID=$SERVER_ID"
# echo "🌱 CLIENT_ID=$CLIENT_ID"
# echo "🌱 DATABASE_URL=$DATABASE_URL,SERVER_ID=$SERVER_ID"
# echo "🌱 TOKEN=$TOKEN"

echodo gcloud --project "$PROJECT_ID" run deploy discord-bot-docker \
    --image $ARTIFACT_REPO_URL/discord-bot-docker:v$VERSION \
    --update-env-vars "CLIENT_ID=$CLIENT_ID,SERVER_ID=$SERVER_ID,SERVER_NAME=$SERVER_NAME,TOKEN=$TOKEN" \
    --update-env-vars "DATABASE_URL=$DATABASE_URL" \
    --update-env-vars "PEOPLE_PERSONAL_WEBSITES=$PEOPLE_PERSONAL_WEBSITES" \
    --region "$GCP_REGION" \
    --allow-unauthenticated \
    --platform 'managed'

echo Try: now:

# locally: docker run -it -p 8087:8080 --env-file ~/git/discord-bot-acts-as-riccardo/.envrc.private gcr.io/vulcanina/discord-bot-docker:v1.1
