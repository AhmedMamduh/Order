class Product < ApplicationRecord
  #------------------------------ Associations --------------------------------
  has_many :order_details
end
