# https://sequel.jeremyevans.net/rdoc/classes/Sequel/Migrator.html
# rake db:migrate[1]
# or just rake db:migrate ...

Sequel.migration do
    up do
        puts "2. Migrating the REAL table :discord_messages .."
        create_table(:discord_messages) do
            primary_key :id
            String :command, null: false
            String :hostname
            String :username
            String :channel_name
            String :marshall_version, null: false
            String :internal_description
            Date :when
        end
    end
    down do
        #puts 'You wish... go get rails!'
        drop_table(:discord_messages)
    end
end
