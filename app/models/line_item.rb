class LineItem < ActiveRecord::Base
  
  belongs_to :order
  has_many :products
  attr_accessible :order_id, :price, :product_id, :quantity
  
end
