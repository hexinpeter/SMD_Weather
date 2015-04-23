class CreatePrecipitations < ActiveRecord::Migration
  def change
    create_table :precipitations do |t|
      t.integer :amount
      t.belongs_to :reading, index: true

      t.timestamps null: false
    end
    add_foreign_key :precipitations, :readings
  end
end
