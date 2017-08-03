class Like < ActiveRecord::Base
	belongs_to :pizza
	belongs_to :user
end
