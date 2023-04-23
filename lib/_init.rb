
#Bot = nil

$long_hostname = Socket.gethostname
$hostname = $long_hostname.split('.').first
$bot_code_url = ENV.fetch 'GITHUB_REPO', 'https://github.com/palladius/discord-bot-acts-as-riccardo'
$today = Time.now.to_s.split(' ').first

$mj_PREQUEL = '/imagine prompt:'
$mj_SEQUEL = ', in the style of Pixar, 4-colors'
MJ_PREQUEL = '' # '/imagine prompt:'
MJ_SEQUEL = '' # ', in the style of Pixar, 4-colors'

version_from_file = File.read('./VERSION').chomp
VERSION = "#{version_from_file}_#{$today}@#{$hostname} (🤖)" # @ Hostname

def gray(s)    "\033[1;30m#{s}\033[0m" ; end
def green(s)   "\033[1;32m#{s}\033[0m" ; end
def red(s)     "\033[1;31m#{s}\033[0m" ; end
def yellow(s)  "\033[1;33m#{s}\033[0m" ; end
def blue(s)  "\033[1;34m#{s}\033[0m" ; end
def purple(s)  "\033[1;35m#{s}\033[0m" ; end
def azure(s)   "\033[1;36m#{s}\033[0m" ; end
def white(s)   "\033[1;37m#{s}\033[0m" ; end
# colors 64k
def orange(s)   "\033[38;5;208m#{s}\033[0m" ; end

def bot_puts(str)
    puts "🤖RicBot@#{$hostname}🤖 #{str}"
end

def bot_event_respond(event, msg)
    event.respond "🤖RicBot v#{VERSION.split('_')[0]} 🇮🇹 #{msg}"
end

def bot_verbose_initialization
    bot_puts "#####################################################################"
    bot_puts "== Welcome to RiccBot v#{VERSION} =="
    bot_puts "Bot connected on: '#{ ENV['SERVER_NAME'] }'"
    bot_puts "Invite the bot into your server by clicking here: #{ Bot.invite_url rescue :dunno }"
    bot_puts "BASE MESSAGES parsed."
    bot_puts "bot code url: #{$bot_code_url}"
    bot_puts "#####################################################################"
end
