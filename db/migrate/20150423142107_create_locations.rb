class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.decimal :longtitude
      t.decimal :latitude

      t.timestamps null: false
    end
  end
end
