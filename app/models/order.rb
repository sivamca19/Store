class Order < ActiveRecord::Base
  
  has_many :line_items
  has_one :billing_address, :dependent => :destroy
  accepts_nested_attributes_for :line_items
  attr_accessible :payment_state, :shipment_state, :total_price, :user_id, :line_items_attributes
  
end
