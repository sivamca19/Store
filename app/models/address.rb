class Address < ActiveRecord::Base
  belongs_to :user
  attr_accessible :firstname, :lastname, :gender, :mobile, :landline, :contry, :state, :city, :pin_code, :user_id
end