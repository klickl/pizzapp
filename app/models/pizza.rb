class Pizza < ActiveRecord::Base
  has_many :composition_pizzas
  has_many :likes

  has_many :ingredients, through: :composition_pizzas
  has_many :likers, through: :likes, source: :user

  belongs_to :restaurant

  validates_uniqueness_of :name


  def has_ingredients?
    self.ingredients.size > 0
  end

  def has_likes?
    self.likers.size > 0
  end

  def number_likes
    self.likers.size
  end

end
