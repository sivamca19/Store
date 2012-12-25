class CreateBillingAddresses < ActiveRecord::Migration
  def change
    create_table :billing_addresses do |t|
      t.string :name
      t.string :email
      t.text :address
      t.string :phone_number
	  t.integer :order_id

      t.timestamps
    end
  end
end
