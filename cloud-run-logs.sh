#!/bin/bash

direnv allow

. .envrc
. .envrc.private

set -e
set -u


echo "🌱 PROJECT_ID: $PROJECT_ID"
echo "🌱 GCP_REGION: $GCP_REGION"

gcloud beta run services logs tail discord-bot-docker --project $PROJECT_ID --region $GCP_REGION
