class CreateOrderGroup < ActiveRecord::Migration
  def change
    create_table :order_groups do |t|
    	t.integer :num
    	t.date :date
    end
  end
end
