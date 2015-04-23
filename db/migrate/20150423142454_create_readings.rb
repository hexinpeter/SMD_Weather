class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
    	t.belongs_to :location, index: true
    	t.belongs_to :source, index: true
      t.datetime :time

      t.timestamps null: false
    end
  end
end
