class AddLatLng < ActiveRecord::Migration
  def self.up
    add_column :stores, :lat, :decimal
    add_column :stores, :lng, :decimal
  end

  def self.down
    remove_column :stores, :lat
    remove_column :stores, :lng
  end
end
