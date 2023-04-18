
require 'discordrb'
require 'socket'

hostname =  Socket.gethostname 
today = Time.now.to_s.split(' ').first

TOKEN = ENV['TOKEN'] or 'NonDatur'
ChannelID = ENV['SERVER_ID'] # 613425648685547541

VERSION = "1.3_#{today}@#{hostname} (🤖)" # @ Hostname

Bot = Discordrb::Commands::CommandBot.new(
  token: ENV['TOKEN'],
  client_id: ENV['CLIENT_ID'],
  prefix: '/'
)

Dir['./lib/*.rb'].each do |f|
  require f 
end

#Bot.run(true)
Bot.run()
