class Product < ActiveRecord::Base
  attr_accessible :name, :description, :category_id, :category_id, :quantity_value, :quantity_id, :no_of_bags, :bag_size, :total_price, :price
  belongs_to :category
  belongs_to :quantity
end
