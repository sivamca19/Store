class User < ActiveRecord::Base
 has_one :address, :dependent => :destroy
 accepts_nested_attributes_for :address
 belongs_to :role
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  #attr_accessor :address_attributes
  delegate :name, :to => :role
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role_id, :address_attributes
end
