class CreateWinds < ActiveRecord::Migration
  def change
    create_table :winds do |t|
      t.string :direction
      t.float :speed
      t.belongs_to :reading, index: true

      t.timestamps null: false
    end
    add_foreign_key :winds, :readings
  end
end
