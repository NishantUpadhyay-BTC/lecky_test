class AddColumnToPins < ActiveRecord::Migration
  def change
    add_column :pins, :postal_code, :text
    add_column :pins, :telephone_number, :text
    add_column :pins, :website, :text
    add_column :pins, :emailadress, :text
    add_column :pins, :address, :text
    add_column :pins, :place, :text
    add_column :pins, :name, :text
  end
end
