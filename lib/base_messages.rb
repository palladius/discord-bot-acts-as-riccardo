

# Bot messages :)
#    Bot.message(with_text: /hello|help/ ) do |event|
Bot.message(content: 'hello' ) do |event|
    bot_event_respond event, '🤖 🇮🇹 Sorry (RegEx) me no speak English me only parla Italiano! 🇮🇹 Try these: `ciao` and `/aiuto`'
    #bot_event_respond event, "🤖 RicBot v#{VERSION} - "
end


Bot.message(with_text: /ping/i) do |event|
  bot_event_respond event, "Pong! Code: #{$bot_code_url}"
  end

  Bot.message(with_text: /ciao/i ) do |event|
    bot_event_respond event, "Ciao a te dal Ric Bot su GProjects su ***#{$hostname}***. I was created to cache/remember MidJourney jobs when Ricc had finished his FAST generation GPUs."
  end

  Bot.message(with_text: 'aiuto') do |event|
    bot_event_respond event, '🇮🇹 [Quelo] La domanda e mal posta. Forse tu volevi sapere che ore sono? O forse `/aiuto`'
    bot_event_respond event, 'Code: #{$bot_code_url}'
  end
  
  Bot.message(with_text: /hello|help/ ) do |event|
    bot_event_respond event, '🇮🇹 Sorry (RegEx) me no speak English me only parla Italiano! 🇮🇹 Try these: `ciao` and `/aiuto`'
  end
  
  Bot.message(with_text: /Alzheimer/i ) do |event|
    bot_event_respond event, '🤖 🇮🇹 Cosa hai detto? Non ho capito..'
    sleep 1
    bot_event_respond event, '🤖 Ah si. Ho preso le medicine?'
    sleep 1
    bot_event_respond event, "Commands Ive memorized so far since last execution (stateless - poor program): #{get_commands}"
  end

  