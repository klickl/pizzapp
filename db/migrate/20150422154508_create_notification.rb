class CreateNotification < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :message
      t.string :action
      t.boolean :viewed
    end

    add_reference :notifications, :user, index: true
  end
end
