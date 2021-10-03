class OrderDetail < ApplicationRecord
  #------------------------------ Associations --------------------------------
  belongs_to :main_order
  belongs_to :product
end
