class AddPizzaRefs < ActiveRecord::Migration
  def change
    add_reference :orders, :pizza, index: true

    add_reference :composition_pizzas, :pizza, index: true
  end
end
