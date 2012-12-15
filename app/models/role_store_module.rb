class RoleStoreModule < ActiveRecord::Base
  attr_accessible :role_id,:store_module_id,:create_status,:update_status,:delete_status
  belongs_to :store_module
  belongs_to :role
  delegate :name, :to => :store_module
end
