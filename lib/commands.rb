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
      bot_event_respond(event, '👎 **No string passed**. Good man. Showing history only (read only)') # todo remove this line once tested
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
    event << '* /debug   # awesome'
    event << '* /memento # awesome too'
    event << '* /long'
    event << '* /aiuto (italian for help)'
    event << '* /invite'
    event << '* /italic and /bold (simple echo servers)'
    event << '* /invite'
    event << '* /mjt # eg, /mjt Alessandro 5year old brown-haired boy, in the style of Pixar'
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

  Bot.command :debug do |event, *args|
    verbose = false
    ret = []
    ret << "Event.class: **#{event.class}**. Docs: http://discordrb.github.io/discordrb/master/Discordrb/Commands/CommandEvent.html"
    ret << "ARGS you gave me: **#{args.join(' ')}**"
    ret << "Event you gave me: **#{event}** (#{event.class})" 
    # https://www.rubydoc.info/github/meew0/discordrb/Discordrb/Channel
    ret << "Channel.name: **#{event.channel.name}**."
    ret << "content: **#{event.content}**."
    ret << "server.name /id : *#{event.server.name}* (**#{event.server.id}**)"
    ret << "user : **#{event.user.name}** (*#{event.user.id}*)"
#    (Discordrb::Commands::CommandEvent). Methods: [:bot, :command=, :command, :server, :saved_message, :author, :file_spoiler, :text, :attach_file, :detach_file, :message, :from_bot?, :filename, :file, :send_file, :voice, :channel, :timestamp, :content, :user, :send_temporary_message, :drain_into, :respond, :send, :send_temp, :send_message, :<<, :send_embed, :drain, :to_yaml, :cleanup_table_oneoff, :db_write_discord_messages, :db_get_discord_messages, :db_init, :db_puts, :to_json, :hash, :singleton_class, :dup, :itself, :methods, :singleton_methods, :protected_methods, :private_methods, :public_methods, :instance_variables, :instance_variable_get, :instance_variable_set, :instance_variable_defined?, :remove_instance_variable, :instance_of?, :kind_of?, :is_a?, :display, :public_send, :extend, :clone, :<=>, :class, :===, :!~, :tap, :then, :frozen?, :nil?, :eql?, :respond_to?, :method, :public_method, :singleton_method, :define_singleton_method, :freeze, :inspect, :object_id, :yield_self, :to_s, :to_enum, :enum_for, :gem, :!, :equal?, :send, :id, :==, :!=, :instance_eval, :instance_exec]
    #for methods in 
    %w{ content message user inspect }.each do |my_method| 
      ret <<  "Event.my_method(#{my_method}, #{my_method.class}) => #{event.send(my_method.to_sym) rescue  "Error(#{my_method}): '#{$!}'" }"
      #ret <<  "Event.my_method(#{my_method}, #{my_method.class}) => #{event.send(my_method.to_s) rescue  "Error(#{my_method}): '#{$!}'" }"
      #event.send(my_method.to_sym)
    end if verbose 
    # verbose stuff ..
    if (verbose)
      ret << "Other channels: *#{event.server.channels.map{|c| c.name}}*"
      ret << "Event Methods: *#{event.methods}*"
    end
    ret.join("\n`[DEB]` ")[0,2000] # max 2k char..
  end



end #/module ping
