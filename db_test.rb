


require 'discordrb'
require 'socket'

Dir['./lib/_init.rb','./lib/db/*.rb',].each do |f|
    require f
end

include DiscordDB
db_init()

puts 'now getting normal messages from DB..'
#ret = db_get_discord_messages(:memento)
#puts ret

mjt_write_message('db_test', 'vediamo se funge')
db_print_all_messages()
