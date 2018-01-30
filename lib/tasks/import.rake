namespace :import do
  desc "Truncate places table and import places from filialstamm.csv"
  task places: :environment do
    ActiveRecord::Base.connection.execute("TRUNCATE places RESTART IDENTITY")
    Place.import
  end

end
