module Ping

    extend Discordrb::Commands::CommandContainer



    # ####
# # commands

Bot.command(:random, min_args: 0, max_args: 2, description: 'Generates a random number between 0 and 1, 0 and max or min and max.', usage: 'random [min/max] [max]') do |_event, min, max|
  # The `if` statement returns one of multiple different things based on the condition. Its return value
  # is then returned from the block and sent to the channel
  if max
    rand(min.to_i..max.to_i)
  elsif min
    rand(0..min.to_i)
  else
    rand
  end
end


Bot.command(:memento) do |event, *args|
  input_message = args.join(' ').to_s
  bot_event_respond event, 'I understand you want to remember a MidJourney command you just issued for the future.'
  if (input_message == '')
    #bot_event_respond(event, '👎 **No string passed**. Good man. Showing history only (read only)') # todo remove this line once tested
  else
    add_command("#{input_message}") unless input_message == ''
  end
  print_commands_as_respond_to(event)
  bot_event_respond event, "👍 These were all the Commands I've memorized so far since last execution (stateless - poor program):"
  return nil # otherwise i got duplicated stuff
end

Bot.command :long do |event|
  event << 'This is a long message.'
  event << 'It has multiple lines that are each sent by doing `event << line`.'
  event << 'This is an easy way to do such long messages, or to create lines that should only be sent conditionally.'
  event << 'Anyway, have a nice day.'
  # Here we don't have to worry about the return value because the `event << line` statement automatically returns nil.
end
Bot.command :aiuto do |event|
  event << "Hi Im a Discor job created by Riccardo. Version is #{VERSION}"
  event << 'Possible **commnds** that have been implemented:'
  event << '* /memento'
  event << '* /long'
  event << '* /aiuto (italian for help)'
  event << '* /invite'
  event << '* /italic and /bold (simple echo servers)'
  event << '* /invite'
  event << 'Anyway, have a nice day.'
  # Here we don't have to worry about the return value because the `event << line` statement automatically returns nil.
end


Bot.command(:invite, chain_usable: false) do |event|
  # This simply sends the bot's invite URL, without any specific permissions,
  # to the channel.
  event.bot.invite_url
end
Bot.command :italic do |_event, *args|
  "*#{args.join(' ')}*"
end
Bot.command :bold do |_event, *args|
  # Again, the return value of the block is sent to the channel
  "**#{args.join(' ')}**"
end
Bot.command :echo do |event, *args|
  event.respond "[Echo] Bold statement: **#{args.join(' ')}**. Bald statement: 🧑‍🦲"
end
Bot.command :user do |event|
  # Commands send whatever is returned from the block to the channel. This allows for compact commands like this,
  # but you have to be aware of this so you don't accidentally return something you didn't intend to.
  # To prevent the return value to be sent to the channel, you can just return `nil`.
  event.user.name
end
Bot.command :muori do |event|
  bot_event_respond event, 'I see you ask me to do *harakiri*. I will. See you soon.'
  bot_puts 'Ive been asked by someone (WHO? Check USER TODO) to die. Arrivederci!'
  exit(42)
end


end
