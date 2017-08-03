class AddGroupsRef < ActiveRecord::Migration
  def change
  	add_reference :order_groups, :group, index: true
  	add_reference :user_groups, :group, index: true
  end
end
