

$long_hostname = Socket.gethostname
$hostname = $long_hostname.split('.').first
$bot_code_url = ENV.fetch 'GITHUB_REPO', 'https://github.com/palladius/discord-bot-acts-as-riccardo'
$today = Time.now.to_s.split(' ').first

version_from_file = File.read('./VERSION').chomp
VERSION = "#{version_from_file}_#{$today}@#{$hostname} (🤖)" # @ Hostname


def bot_puts(str)
    puts "🤖RicBot@#{$hostname}🤖 #{str}"
end


bot_puts "#####################################################################"
bot_puts "== Welcome to RiccBot v#{VERSION} =="
bot_puts "Bot connected on: '#{ ENV['SERVER_NAME'] }'"
bot_puts "Invite the bot into your server by clicking here: #{ Bot.invite_url }"
bot_puts "BASE MESSAGES parsed."
bot_puts "bot code url: #{$bot_code_url}"
bot_puts "#####################################################################"

