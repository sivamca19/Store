class CreateStoreModules < ActiveRecord::Migration
  def change
    create_table :store_modules do |t|
      t.string :name
      t.timestamps
    end
  end
end
