class CreateQuantities < ActiveRecord::Migration
  def change
    create_table :quantities do |t|
      t.string :quantity_type
	  t.string :symbol
      t.timestamps
    end
  end
end
