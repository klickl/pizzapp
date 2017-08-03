class AddPrivilegeRef < ActiveRecord::Migration
  def change
  	add_reference :users, :privilege, index: true
  end
end
