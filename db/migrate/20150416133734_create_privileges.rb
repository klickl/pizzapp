class CreatePrivileges < ActiveRecord::Migration
  def change
    create_table :privileges do |t|
    	t.string :label
    	t.integer :level
    end
  end
end
