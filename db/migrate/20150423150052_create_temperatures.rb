class CreateTemperatures < ActiveRecord::Migration
  def change
    create_table :temperatures do |t|
      t.float :value
      t.float :dew_point
      t.belongs_to :reading, index: true

      t.timestamps null: false
    end
    add_foreign_key :temperatures, :readings
  end
end
