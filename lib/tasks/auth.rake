namespace :auth do
  desc "Search for an user and saves it"
  task create_user: :environment do
    user = User.where(email: 'mark@i-pol.com').first_or_initialize
    user.save(password: '123456', password_confirmation: '123456')
  end
end
