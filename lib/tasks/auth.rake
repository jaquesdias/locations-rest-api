namespace :auth do
  desc "Search for an user and saves it"
  task create_user: :environment do
    user = User.where(email: 'mark@i-pol.com').first_or_initialize
    user.attributes = { password: '123456', password_confirmation: '123456' }
    user.save
  end
end
