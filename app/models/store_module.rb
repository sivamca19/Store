class StoreModule < ActiveRecord::Base
  attr_accessible :name
  after_create :create_role_store_module
  
  def create_role_store_module
	RoleStoreModule.create(:store_module_id => self.id, :role_id => "2")
  end
end
