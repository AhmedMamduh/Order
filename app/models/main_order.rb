class MainOrder < ApplicationRecord
  #------------------------------ Associations --------------------------------
  belongs_to :user
  has_many :order_details

  #---------------------------------- Enums -----------------------------------
  enum statuses: {accepted: 0, rejected: 1}
end
