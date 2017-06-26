namespace :db do
  desc "Add an admin account to the database"
  task heroku_seed: :environment do
    if User.size == 0
      User.create(email: ENV['ADMIN_ACCOUNT'], password: ENV['ADMIN_PASSWORD'])
    end
  end
end
