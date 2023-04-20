


require 'discordrb'
require 'socket'

Dir['./lib/_init.rb','./lib/db/*.rb',].each do |f|
    require f
end

include DiscordDB
db_init()


