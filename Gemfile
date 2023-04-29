
 source "https://rubygems.org"

gem 'discordrb', '3.4.0'
# For MySQL
gem 'sequel'
# to fix this horrible ENV stuff..
gem 'dotenv'

################################################################################
# to run via buildpacks: https://docs.cloudfoundry.org/buildpacks/ruby/ruby-tips.html
gem 'rack'
gem 'ocra' # to bundle ruby
################################################################################

############################
# Possible Databases
############################

# 🐧 sudo apt-get install sqlite3 libsqlite3-dev
gem 'sqlite3'
# 🐧 sudo apt-get install libmysql-ruby libmysqlclient-dev mysql-common # fails
# 🐧 sudo apt-get install  libmariadb-dev # success 👍 OK(20230420-184709): bundle install
gem 'mysql2'

