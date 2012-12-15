class CreateRoleStoreModules < ActiveRecord::Migration
  def change
    create_table :role_store_modules do |t|
      t.integer :role_id
      t.integer :store_module_id
      t.boolean :create_status,:default => false
      t.boolean :update_status,:default => false      
      t.boolean :delete_status,:default => false
      t.timestamps
    end
  end
end
