# See migrations for what's in the DB :)
# Amazing CS: https://github.com/jeremyevans/sequel/blob/master/doc/cheat_sheet.rdoc

module DiscordDB 

    require 'sequel'
    TableName = 'discord_messages_test'

    mysql_url = ENV.fetch('ENV_DB_URL', 'sqlite3://default.sqlite3')

    puts "DB URL: #{mysql_url}"
    DB = Sequel.connect(mysql_url) 
#    exit 42

    #puts mysql2("SELECT * FROM #{TableName}")
    items = DB[:discord_messages_test] 
    
    puts DB.class.superclass
    puts DB.is_a?(Sequel::Database)
    puts "Thwe table #{TableName} has #{items.count} elements"
#    puts items.size
    #items.insert(hostname: 'abc') # , price: rand * 100)



end #/module