#!/bin/bash

set -x

direnv allow
bundle exec ruby bot.rb
