class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
	  t.string :name
	  t.text :description
	  t.integer :category_id
	  t.decimal :quantity_value
	  t.decimal :no_of_bags
	  t.decimal :bag_size
	  t.decimal :total_price
	  t.decimal :price
	  t.integer :quantity_id
      t.timestamps
    end
  end
end
