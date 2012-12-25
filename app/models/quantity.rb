class Quantity < ActiveRecord::Base
  attr_accessible :quantity_type, :symbol
  has_many :products
end
