#!/bin/bash

set -e
set -u

eval "$(direnv hook bash)"
direnv allow

source .envrc.private
. .envrc.private

echo "============================================================"
echo "Welcome to entrypoint8080 for Discord Bot vTODO "
bin/show-needed-envs.sh

#echo "🚪 SERVER_ID=       $SERVER_ID"
#echo "🚪 CLIENT_ID=       $CLIENT_ID"
#echo "🚪 DATABASE_URL=    $DATABASE_URL"
#echo "🚪 TOKEN=           $TOKEN"

echo "============================================================"

ruby bot.rb
