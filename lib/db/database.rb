# See migrations for what's in the $db :)
# Amazing CS: https://github.com/jeremyevans/sequel/blob/master/doc/cheat_sheet.rdoc

module DiscordDB

    require 'sequel'
    # consts
    DEFAULT_DATABASE_URL = 'sqlite3://default.sqlite3'
    TableName = 'discord_messages'
    # global vars
    $db ||= nil
    $debugSQLMessages = true

    # methods
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
        puts(azure("db_write_discord_messages.insert(#{hash})")) if $debugSQLMessages
        items.insert(hash)
    end

    def mjt_write_message(title, description)
        h = {}
        h[:topic] = title
        h[:channel_name] = '_mjt_write_'
        h[:command] = description
        h[:internal_description] = 'testing MJT write v??'
        db_write_discord_messages(h)
    end

    def db_get_discord_messages(topic=nil)
        items = $db[TableName.to_sym]
        sql = "SELECT command FROM #{TableName} "
        sql += " WHERE topic = '#{topic}' " if topic
        sql += ';'
        print "[deb] SQL: '''#{sql}'''"
        ret = []
        $db.fetch(sql) do |row|
            ret << row[:command]
            #puts row[:command]
        end
        ret
    end

    # {:id=>2, :command=>"we are in PROD on MySQL yoohoo!!", :hostname=>"ricc-macbookpro3.roam.internal", :username=>"ricc", :channel_name=>nil, :marshall_version=>"1.3", :internal_description=>"test 2 (DB with hash - will it work?)",
    #     :when=>#<Date: 2023-04-20 ((2460055j,0s,0n),+0s,2299161j)>, :topic=>"tests"}

    def fancy_row_print(row, opts={})
        opts_verbose = opts.fetch(:verbose, false)

        puts row if opts_verbose
        host = row[:hostname].split('.').first rescue '?'
        puts "#{row[:when]} #{row[:username]}@#{host} [#{row[:topic]}] #{row[:command]}"
    end

    def db_print_all_messages(opts={})
        items = $db[TableName.to_sym]
        sql = "SELECT * FROM #{TableName} "
        sql += ';'
        puts "[deb] SQL: '''#{sql}'''"
        ret = []
        $db.fetch(sql) do |row|
            ret << row# [:command]
            fancy_row_print(row)
            #puts row[:command]
        end
        ret
    end

    def db_init()

        mysql_url = ENV.fetch('DATABASE_URL', DEFAULT_DATABASE_URL)

        puts "$db URL: #{mysql_url}"
        $db ||= Sequel.connect(mysql_url)
        if $db.is_a?(Sequel::Database)
            puts green("$db found (type: #{$db.class})")

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
