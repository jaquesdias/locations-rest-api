class Place < ApplicationRecord
  def self.import
    file_path = "#{Rails.public_path}/filialstamm.csv"
    raise "File does not exist" unless File.exists? file_path

    CSV.foreach(file_path, headers: true, header_converters: :symbol, col_sep: ";", encoding:'iso-8859-1:utf-8') do |row|
      Place.create!(
        customer_id:  row[:kundennummer].to_i,
        store_number: row[:filialnummer].to_i,
        store_name:   row[:filialname].to_s.strip,
        street:       row[:strasse].to_s.strip,
        zip_code:     row[:plz].to_s.strip,
        place:        row[:ort].to_s.strip
      ) unless row.empty?
    end
  end
end
