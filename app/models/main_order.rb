class MainOrder < ApplicationRecord
  #------------------------------ Associations --------------------------------
  belongs_to :user

  #---------------------------------- Enums -----------------------------------
  enum statuses: {accepted: 0, rejected: 1}
end
