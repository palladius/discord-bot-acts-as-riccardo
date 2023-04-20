

$long_hostname = Socket.gethostname
$hostname = $long_hostname.split('.').first
$bot_code_url = ENV.fetch 'GITHUB_REPO', 'https://github.com/palladius/discord-bot-acts-as-riccardo'
$today = Time.now.to_s.split(' ').first

MJ_PREQUEL = '/imagine prompt:'
MJ_SEQUEL = ', in the style of Pixar, 4-colors'

version_from_file = File.read('./VERSION').chomp
VERSION = "#{version_from_file}_#{$today}@#{$hostname} (🤖)" # @ Hostname


def bot_puts(str)
    puts "🤖RicBot@#{$hostname}🤖 #{str}"
end
def bot_event_respond(event, msg) 
    event.respond "🤖RicBot v#{VERSION.split('_')[0]} 🇮🇹 #{msg}"
end

bot_puts "#####################################################################"
bot_puts "== Welcome to RiccBot v#{VERSION} =="
bot_puts "Bot connected on: '#{ ENV['SERVER_NAME'] }'"
bot_puts "Invite the bot into your server by clicking here: #{ Bot.invite_url }"
bot_puts "BASE MESSAGES parsed."
bot_puts "bot code url: #{$bot_code_url}"
bot_puts "#####################################################################"

