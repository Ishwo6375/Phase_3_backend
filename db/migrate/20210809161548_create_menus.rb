class CreateMenus < ActiveRecord::Migration[5.2]
  def change
   create_table :menus do |t|
    t.string :food_name
    t.string :image
    t.string :description
    t.string :price
    t.integer :restaurant_id
   end
  end
end
