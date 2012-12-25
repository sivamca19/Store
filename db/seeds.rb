# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

StoreModule.find_or_create_by_name(:name=>'User Management')
StoreModule.find_or_create_by_name(:name=>'Product Management')
StoreModule.find_or_create_by_name(:name=>'Order Management')
StoreModule.find_or_create_by_name(:name=>'Store Management')
User.find_or_create_by_email(email: "admin@store.com",password: "123456",password_confirmation: "123456")

Category.find_or_create_by_name(:name => "Hardware & Building")
Category.find_or_create_by_name(:name => "Housewares & Electrical")
Category.find_or_create_by_name(:name => "Hand & Power Tools")
Category.find_or_create_by_name(:name => "Kitchens")
Category.find_or_create_by_name(:name => "Paint & Decorating")
Category.find_or_create_by_name(:name => "Gardening & Outdoor")
Category.find_or_create_by_name(:name => "Trade")

Quantity.find_or_create_by_quantity_type(:quantity_type => "Kilogram", :symbol => "kg")
Quantity.find_or_create_by_quantity_type(:quantity_type => "Meter", :symbol => "m")
Quantity.find_or_create_by_quantity_type(:quantity_type => "Litre", :symbol => "lt")
Quantity.find_or_create_by_quantity_type(:quantity_type => "Ton", :symbol => "tn")
Quantity.find_or_create_by_quantity_type(:quantity_type => "Gram", :symbol => "g")