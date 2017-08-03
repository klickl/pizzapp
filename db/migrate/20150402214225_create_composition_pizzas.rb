class CreateCompositionPizzas < ActiveRecord::Migration
  def change
    create_table :composition_pizzas do |t|
      t.timestamps
    end
  end
end
