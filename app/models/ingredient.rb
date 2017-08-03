class Ingredient < ActiveRecord::Base
  has_many :pizzas, through: :composition_pizzas
end
