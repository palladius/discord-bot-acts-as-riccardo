

# Bot messages :)
#    Bot.message(with_text: /hello|help/ ) do |event|
Bot.message(content: 'hello' ) do |event|
    event.respond '🤖 🇮🇹 Sorry (RegEx) me no speak English me only parla Italiano! 🇮🇹 Try these: `ciao` and `/aiuto`'
    event.respond "🤖 RicBot v#{VERSION}"
end


Bot.message(with_text: 'Ping!') do |event|
    event.respond '🤖 Pong!'
  end
  Bot.message(with_text: 'ciao') do |event|
    event.respond '🤖 🇮🇹 ciao a te dal Ric Bot su GProjects. I was created to cache/remember MidJourney jobs when Ricc had finished'
    event.respond "🤖 RicBot v#{VERSION}"
  end
  Bot.message(with_text: 'aiuto') do |event|
    event.respond '🤖 🇮🇹 [Quelo] La domanda e mal posta. Forse tu volevi sapere che ore sono? O forse `/aiuto`'
  end
  
  # Bot.message(with_text: 'hello') do |event|
  #   event.respond '🤖 🇮🇹 SorryOld me no speak English me only parla Italiano! 🇮🇹 Try these: `ciao` and `/aiuto`'
  #   event.respond "🤖 RicBot v#{VERSION}"
  # end
  Bot.message(with_text: /hello|help/ ) do |event|
    event.respond '🤖 🇮🇹 Sorry (RegEx) me no speak English me only parla Italiano! 🇮🇹 Try these: `ciao` and `/aiuto`'
    event.respond "🤖 RicBot v#{VERSION}"
  end
  
  Bot.message(with_text: 'Alzheimer') do |event|
    event.respond '🤖 🇮🇹 Cosa hai detto? Non ho capito..'
    sleep 1
    event.respond '🤖 Ah si. Ho preso le medicine?'
    sleep 1
    event.respong "Commands Ive memorized so far since last execution (stateless - poor program): #{get_commands}"
  end

  