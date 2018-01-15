class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :restaurant_name
      t.string :restaurant_cuisine
      t.integer :restaurant_price
      t.string :restaurant_address

      t.timestamps
    end
  end
end
