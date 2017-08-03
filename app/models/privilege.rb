class Privilege < ActiveRecord::Base
  has_many :user
end