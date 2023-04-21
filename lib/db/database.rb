# See migrations for what's in the $db :)
# Amazing CS: https://github.com/jeremyevans/sequel/blob/master/doc/cheat_sheet.rdoc

module DiscordDB

    require 'sequel'

    TableName = 'discord_messages'
    $db ||= nil

    def db_puts(str)
        puts "🔋RicBot.DB🔋 #{str}"
    end

    # i started creating sample things with fake 123 host :) now useless but code still useful.
    def cleanup_table_oneoff()
        sql = "DELETE FROM #{TableName} where hostname = 'abc' "
        $db.run(sql) if $db
    end

    def db_write_discord_messages(hash)
        items = $db[TableName.to_sym]
        hash[:internal_description] ||= 'test 2 (db_write_discord_messages())' # it does :)
        items.insert(hash)
    end

    def db_get_discord_messages(topic=nil)
        items = $db[TableName.to_sym]
        sql = "SELECT command FROM #{TableName} "
        sql += " WHERE topic = '#{topic}' " if topic 
        sql += ';'
        print "SQL: '''#{sql}'''"
        ret = []
        $db.fetch(sql) do |row|
            ret << row[:command]
            #puts row[:command]
        end
        ret
    end

    def db_init()

        mysql_url = ENV.fetch('ENV_DB_URL', 'sqlite3://default.sqlite3')

        puts "$db URL: #{mysql_url}"
        $db ||= Sequel.connect(mysql_url)
        if $db.is_a?(Sequel::Database)
            puts "$db found: #{$db}"

            #puts mysql2("SELECT * FROM #{TableName}")
            items = $db[TableName.to_sym]
            #items.insert(hostname: $long_hostname) # , price: rand * 100)

            #db_puts $db.class.superclass
            #db_puts $db.is_a?(Sequel::Database)

            $db ||= $db # if $db.is_a?(Sequel::Database)
            #cleanup_table_oneoff()

            db_puts "The table '#{TableName}' has #{items.count} elements"
        end
    end






end #/module
