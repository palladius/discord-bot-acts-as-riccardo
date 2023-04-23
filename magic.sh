#!/bin/bash

set -x

#direnv allow
echo WARNING: ignoring direnv. I wanna see if rackup can hold the ENV complexity or not..
rackup

#bundle exec ruby bot.rb
