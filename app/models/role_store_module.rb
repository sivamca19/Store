class RoleStoreModule < ActiveRecord::Base
  attr_accessible :role_id,:store_module_id,:create,:update,:delete
  belongs_to :store_module
  belongs_to :role
end
