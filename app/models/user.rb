class User < ApplicationRecord
  #-------------------------------- Plugins -----------------------------------
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable

  #------------------------------ Associations --------------------------------
  has_many :main_orders

  #------------------------------- Validations --------------------------------
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  #--------------------------------- Methods ----------------------------------
  def generate_jwt
    JWT.encode({id: id, exp: 60.days.from_now.to_i}, Rails.application.secrets.secret_key_base)
  end

end
