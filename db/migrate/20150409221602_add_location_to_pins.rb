class AddLocationToPins < ActiveRecord::Migration
  def change
    add_column :pins, :latitude, :float
    add_column :pins, :longitude, :float
    add_column :pins, :location, :text
  end
end
