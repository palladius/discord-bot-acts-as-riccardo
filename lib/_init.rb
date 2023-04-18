

$long_hostname = Socket.gethostname
$hostname = $long_hostname.split('.').first

def bot_puts(str)
    puts "🤖RicBot@#{$hostname}🤖 #{str}"
end


bot_puts "#####################################################################"
bot_puts "== Welcome to RiccBot v#{VERSION} =="
bot_puts "Bot connected on: '#{ ENV['SERVER_NAME'] }'"
bot_puts "Invite the bot into your server by clicking here: #{ Bot.invite_url }"
bot_puts "BASE MESSAGES parsed."
bot_puts "#####################################################################"

