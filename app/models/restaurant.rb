class Restaurant < ActiveRecord::Base
  has_many :pizzas
end