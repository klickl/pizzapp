class Order < ActiveRecord::Base
	belongs_to :pizza
	belongs_to :user
	belongs_to :order_group
end
