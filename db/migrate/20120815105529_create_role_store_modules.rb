class CreateRoleStoreModules < ActiveRecord::Migration
  def change
    create_table :role_store_modules do |t|
      t.integer :role_id
      t.integer :store_module_id
      t.boolean :create,:default => false
      t.boolean :update,:default => false      
      t.boolean :delete,:default => false
      t.timestamps
    end
  end
end
