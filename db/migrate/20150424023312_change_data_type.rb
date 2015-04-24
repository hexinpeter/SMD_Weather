class ChangeDataType < ActiveRecord::Migration
  def up
  	change_column :locations, :longtitude, :decimal, precision: 8, scale: 5
  	change_column :locations, :latitude, :decimal, precision: 8, scale: 5
  	change_column :temperatures, :value, :decimal, precision: 8, scale: 5
  	change_column :temperatures, :dew_point, :decimal, precision: 8, scale: 5
  	change_column :winds, :speed, :decimal, precision: 8, scale: 5
  	change_column :precipitations, :amount, :decimal, precision: 8, scale: 5
  end
  def down
  end
end
