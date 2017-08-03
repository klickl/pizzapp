class AddUserRefToGroup < ActiveRecord::Migration
  def change
  	add_reference :user_groups, :user, index: true
  end
end
