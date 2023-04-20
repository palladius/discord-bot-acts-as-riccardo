

module DiscordDB 

    require 'sequel'

    mysql_url = ENV.fetch('ENV_DB_URL', 'sqlite3://default.sqlite3')

    puts "DB URL: #{mysql_url}"
    Sequel.connect(mysql_url) 
    exit 42
    Sequel.migration do
        up do
            create_table(:table_name) do
                primary_key :id
                String :command
                String :hostname
                String :marshall_version
                Date :when
#                 :when: '2023-04-19 17:10:04 +0200'
#   :command: epic scifi art, xenomorphic puffin, style of H. R. giger, Dan hillier,
#     coal, hematite, oilslick::4 puffin tax::0.5 --ar 2:3
#   :hostname: derek.zrh.corp.google.com
#   :marshall_version: '1.1'
            end
        end
        down do 
            puts 'You wish... go get rails!'
        end
    end

end #/module