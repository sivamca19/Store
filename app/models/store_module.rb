class StoreModule < ActiveRecord::Base
  attr_accessible :name
  has_many :role_store_modules
  has_many :roles, :through => :role_store_modules
  scope :fetch_by_id, lambda { |id| where("id = ?", id)}
  scope :fetch_all, order("name")
  scope :find_modules, lambda{ |name| where("name = ?", name)}
end
