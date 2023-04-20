# https://sequel.jeremyevans.net/rdoc/classes/Sequel/Migrator.html
# rake db:migrate[1] 
Sequel.migration do
    up do
        create_table(:discord_messages_test) do
            primary_key :id
            String :command, null: false
            String :hostname
            String :marshall_version, null: false
            String :internal_description
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
        drop_table(:discord_messages_test)
    end
end
