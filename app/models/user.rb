class User < ActiveRecord::Base
	#Ajout des tables de jointure
	has_many :orders
	has_many :likes
	has_many :user_groups
	has_many :notifications

	#ajout des relations
	has_many :pizzas_ordered, through: :orders, source: :pizza
	has_many :pizzas_liked, through: :likes, source: :pizza

	has_many :groups_created, class_name: 'Group', foreign_key: 'user_id'
	has_many :groups, through: :user_groups

	belongs_to :privilege


	def has_created_groups?
		self.groups_created.size > 0
	end

	def is_member_of_group?
		self.groups.size > 0
	end

	def likes?(pizza)
		return pizzas_liked.include?(pizza)
	end

  def is_notified?
    result = false
    if self.notifications.size > 0
      self.notifications.each do |notification|
        if notification.viewed == false
          result = true
        end
      end
    end
    result
  end
end
