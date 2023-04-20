namespace :db do
    desc "Run migrations (copied from https://github.com/jeremyevans/sequel/blob/master/doc/migration.rdoc)"
    task :migrate, [:version] do |t, args|
      require "sequel/core"
      Sequel.extension :migration
      version = args[:version].to_i if args[:version]
      Sequel.connect(ENV.fetch("ENV_DB_URL")) do |db|
        Sequel::Migrator.run(db, "lib/db/migrations", target: version)
      end
    end
  end