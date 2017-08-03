class AddIngredientRefToCompositionPizza < ActiveRecord::Migration
  def change
    add_reference :composition_pizzas, :ingredient, index: true
  end
end
