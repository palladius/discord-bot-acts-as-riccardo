

EnvPeopleWebsites = ENV.fetch('PEOPLE_PERSONAL_WEBSITES', '')

MJ_PREQUEL = '/imagine prompt:'
MJ_SEQUEL = ', in the style of Pixar, 4-colors'




def getPeopleWebsites()
    peopleWebsites = EnvPeopleWebsites.split("\n")
    raise "Malformed variable, should be a multiline starting with 'ArrayOf:' and then have a NAME and URL with triple ::: separator. Instead this is what I see: #{peopleWebsites}" unless peopleWebsites[0] == "ArrayOf:"
    peopleWebsites.shift() # remove the first
    peopleWebsites.map{|line| 
        line.split(':::').map{|element| element.strip.chomp } 
    }
end

  # PEOPLE_PERSONAL_WEBSITES
  Bot.message(with_text: 'mjaj') do |event|
    event.respond '🤖 Riccardo, I understand you want to call MidJourney with your son Alessandro... '
    sleep 1
    event.respond '/imagine prompt:a golden lion, in the style of Pixar --v 4'
  end
  
  Bot.message(with_text: 'mj_urls') do |event|
    getPeopleWebsites.each do |person, url| 
        #url = :boh
        bot_event_respond event, "Private MJ page of **#{person}** 🌍 #{url}"
    end
  end



  bot_puts "DEBUG: getPeopleWebsites #{ getPeopleWebsites() }"