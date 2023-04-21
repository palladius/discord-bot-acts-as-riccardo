# https://sequel.jeremyevans.net/rdoc/classes/Sequel/Migrator.html

Sequel.migration do
    up do
        puts "3. Adding topic column to :discord_messages .."
        add_column :discord_messages, :topic, String
    end
    down do
        #puts 'You wish... go get rails!'
        drop_column :discord_messages, :topic
    end
end
