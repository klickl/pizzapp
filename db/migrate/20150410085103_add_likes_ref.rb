class AddLikesRef < ActiveRecord::Migration
  def change
  	add_reference :likes, :user, index: :true
  	add_reference :likes, :pizza, index: :true
  end
end
