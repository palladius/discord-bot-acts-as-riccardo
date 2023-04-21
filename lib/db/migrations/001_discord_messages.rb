# https://sequel.jeremyevans.net/rdoc/classes/Sequel/Migrator.html
# rake db:migrate[1] 
Sequel.migration do
    up do
        puts "1. Create fake table to do some tests :discord_messages_test .."
        create_table(:discord_messages_test) do
            primary_key :id
            String :command, null: false
            String :hostname
            String :marshall_version, null: false
            String :internal_description
            Date :when
        end
    end
    down do 
        puts 'You wish... go get rails!'
        drop_table(:discord_messages_test)
    end
end
