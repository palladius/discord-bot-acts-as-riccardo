

# test:
# 	https://github.com/shardlab/discordrb/blob/main/examples/ping.rb

magic: .envrc.private
	./magic.sh

dbtest:
	bundle exec ruby  db_test.rb


.envrc.private:
	echo Check documentation and make sure to create .envrc.private...
	exit 42
