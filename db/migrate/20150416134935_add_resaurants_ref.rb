class AddResaurantsRef < ActiveRecord::Migration
  def change
  	add_reference :pizzas, :restaurant, index: true
  end
end
