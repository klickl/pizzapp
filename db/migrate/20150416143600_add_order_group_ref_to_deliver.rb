class AddOrderGroupRefToDeliver < ActiveRecord::Migration
  def change
  	add_reference :delivers, :order_group, index: true
  end
end
