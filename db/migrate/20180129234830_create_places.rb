class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.integer :customer_id
      t.integer :store_number
      t.string :street
      t.string :zip_code
      t.string :place
      t.string :store_name
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
