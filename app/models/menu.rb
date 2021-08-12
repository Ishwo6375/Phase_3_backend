class Menu < ActiveRecord::Base
 belongs_to :restaurant
end

def assign_menu()
  Menu.restaurant_id = Restaurant.id
  save
end