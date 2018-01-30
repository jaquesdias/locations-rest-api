class Place < ApplicationRecord
  def self.import
    file_path = "#{Rails.public_path}/filialstamm.csv"
    raise "File does not exist" unless File.exists? file_path

    CSV.foreach(file_path, headers: true, col_sep: ";", encoding:'iso-8859-1:utf-8') do |row|
      Place.create!(
        customer_id:  row["Kundennummer"],
        store_number: row["Filialnummer"],
        store_name:   row["Filialname"],
        street:       row["Strasse"],
        zip_code:     row["PLZ"],
        place:        row["ORT"]
      )
    end
  end
end
