
require 'discordrb'
require 'socket'

#hostname =  Socket.gethostname


TOKEN = ENV['TOKEN'] or 'NonDatur'
ChannelID = ENV['SERVER_ID']

raise "ENV['SERVER_ID'] is null. Please provide proper ENV vars!" unless ENV['SERVER_ID']
raise "ENV['TOKEN'] is null. Please provide proper ENV vars!" unless ENV['TOKEN']
raise "ENV['CLIENT_ID'] is null. Please provide proper ENV vars!" unless ENV['CLIENT_ID']



Bot = Discordrb::Commands::CommandBot.new(
  token: ENV['TOKEN'],
  client_id: ENV['CLIENT_ID'],
  prefix: '/'
)

Dir['./lib/*.rb', './lib/db/*.rb'].each do |f|
  require f
end

bot_verbose_initialization()

include DiscordDB
db_init()

#add_command('Migration is now done on Mac on MYSQL woohoo!')
#puts get_commands()
#exit 43

Bot.run()
