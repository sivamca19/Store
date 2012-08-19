class Role < ActiveRecord::Base
  attr_accessible :name
  has_many :user_roles
  has_many :users, :through => :user_roles
  has_and_belongs_to_many:store_modules
  has_many :role_store_modules
  has_many :store_modules, :through => :role_store_modules
end
