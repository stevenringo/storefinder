class CreateStoresProducts < ActiveRecord::Migration
  def self.up
    create_table :stores_products do |t|
      t.references :store
      t.references :product
      t.timestamps
    end
  end

  def self.down
    drop_table :stores_products
  end
end
