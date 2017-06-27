namespace :db do
  desc "Add an admin account to the database"
  task heroku_seed: :environment do
    if User.all.size.zero?
      admin = User.new(email: ENV['ADMIN_ACCOUNT'], password: ENV['ADMIN_PASSWORD'], role: 'admin')
      if admin.save

      else
        puts admin.errors.full_messages.join('. ')
      end
    end
  end
end
