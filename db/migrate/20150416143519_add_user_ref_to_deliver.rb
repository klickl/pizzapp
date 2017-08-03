class AddUserRefToDeliver < ActiveRecord::Migration
  def change
  	add_reference :delivers, :user, index: true
  end
end
