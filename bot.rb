
require 'discordrb'
require 'socket'

#hostname =  Socket.gethostname 


TOKEN = ENV['TOKEN'] or 'NonDatur'
ChannelID = ENV['SERVER_ID']


Bot = Discordrb::Commands::CommandBot.new(
  token: ENV['TOKEN'],
  client_id: ENV['CLIENT_ID'],
  prefix: '/'
)

Dir['./lib/*.rb'].each do |f|
  require f 
end

bot_verbose_initialization()

Bot.run()
