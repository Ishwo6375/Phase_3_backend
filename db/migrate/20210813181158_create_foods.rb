class CreateFoods < ActiveRecord::Migration[5.2]
  def change
   create_table :foods do |t|
    t.string :food_name
    t.string :image
    t.string :description
    t.integer :price
    t.integer :restaurant_id
   end
  end
end