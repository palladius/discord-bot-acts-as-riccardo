$commands = {}
# or maybe persist to firebase.. :)

$persist_to_file = 'commands-marshall.yaml'
$marshall_version = '1.2'

=begin

1. Marshal

# dumping:
#File.open("test.marshal", "w"){|to_file| YAML.dump(movies, to_file)}
# retrieving:
#p File.open("test.marshal", "r"){|from_file| YAML.load(from_file)}

2. YAML

File.write('movies.yml', movies.to_yaml)

# read back in from file
from_file = YAML.load_file('movies.yml')

=end
require 'yaml'

def _retrieve_file_to_array()
    file_content = YAML.load_file($persist_to_file) || [] #  rescue []
    #pp file_content
    raise "Wrong UnMarshall and UnLily READ: this should be an array: insteasd its a  #{file_content.class}" unless file_content.is_a? Array
    return file_content
end

def write_array_to_file(arr)
    raise "Wrong UnMarshall and UnLily WRITE: this should be an array: insteasd its a  #{arr.class}" unless arr.is_a? Array
    return File.write($persist_to_file, arr.to_yaml)

end


def add_command(my_command)

  new_entry = {
    when:  Time.now.to_s,
    command: my_command,
    hostname: $long_hostname,
    marshall_version: $marshall_version, # update if yuoui change schema...
  }
  #puts 'db: ', $db

  if $db
    # write to MySQL and similar..
    bot_puts "DB found: '#{$db}'"
    # items = $db[:discord_messages_test]
    # items.insert(
    #   when:  Time.now.to_s,
    #   command: my_command,
    #   hostname: $long_hostname,
    #   marshall_version: $marshall_version,
    #   #internal_description: 'test 1',
    # )
    # TODO refactor here :)
    db_write_discord_messages(new_entry)
  else
    # write to YAML file..
    commands_array = _retrieve_file_to_array()
    bot_puts "DB NOT found: '#{$db}'"
    commands_array << new_entry
    write_array_to_file(commands_array)
  end
  return
end

def get_commands()
  if $db
    #puts 'DB found!'
    db_get_discord_messages()
  else
    commands = _retrieve_file_to_array.map{|h| h[:command]}
    pp commands # ["command-v1-${Time.now}"] = blah
    commands # ["command-v1-${Time.now}"] = blah
  end
end

def print_commands_as_respond_to(event)
  cmds = get_commands()
  cmds.each do |cmd|
    event.respond "* `#{MJ_PREQUEL}#{cmd}#{MJ_SEQUEL}`"
  end
end

if $DEBUG
  add_command('DEBUG enabled: Testing the system')
  pp "DEBUG COMMANDS: #{get_commands()}"
end
