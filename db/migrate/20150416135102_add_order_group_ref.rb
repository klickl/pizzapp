class AddOrderGroupRef < ActiveRecord::Migration
  def change
  	add_reference :orders, :order_group, index: true
  end
end
