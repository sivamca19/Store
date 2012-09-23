class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :firstname
      t.string :lastname
      t.string :gender
      t.integer :mobile
      t.integer :landline
      t.string :contry
      t.string :state
      t.string :city
      t.integer :pin_code
      t.timestamps
    end
    add_index :addresses, :user_id
  end
end
