#!/bin/bash

set -e
set -u

source .envrc.private
. .envrc.private
echo SERVER_ID=$SERVER_ID
echo APPLICATION_ID=$APPLICATION_ID

ruby bot.rb
