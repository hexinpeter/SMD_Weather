class AddSinceNineToPrecipitation < ActiveRecord::Migration
  def change
    add_column :precipitations, :since_nine, :decimal, precision: 8, scale: 5
  end
end
