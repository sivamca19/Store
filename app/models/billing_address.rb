class BillingAddress < ActiveRecord::Base
  
  belongs_to :order
  attr_accessible :address, :email, :name, :phone_number, :order_id
  
end
