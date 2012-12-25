class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.decimal :total_price
      t.string :payment_state
      t.string :shipment_state

      t.timestamps
    end
  end
end
