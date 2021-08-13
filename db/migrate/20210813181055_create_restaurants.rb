class CreateRestaurants < ActiveRecord::Migration[5.2]
   def change
   create_table :restaurants do |t|
    t.string :name
    t.string :image
    t.string :restaurant_type
    t.string :location
    t.integer :contact
   end
  end
end
