class StoreModule < ActiveRecord::Base
  attr_accessible :name
  has_many :roles, :through => :role_store_modules
  #~ after_create :create_role_store_module
  
  #~ def create_role_store_module
	#~ RoleStoreModule.create(:store_module_id => self.id, :role_id => "2")
  #~ end

  def self.create_role_store_module(shopo_module,role_id)
    shopo_module.each{ |x|  RoleStoreModule.create(:store_module_id=>x,:role_id=>role_id)}
  end
end
