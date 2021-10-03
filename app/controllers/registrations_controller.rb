class RegistrationsController < Devise::RegistrationsController

  def create
    user = User.new(sign_up_params)

    if user.save
      token = user.generate_jwt
      user.update(token: token)
      render json: user
    else
      render json: { errors: user.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  private
  def sign_up_params
    params.permit(:first_name, :middle_name, :last_name, :phone_number, :email, :password, :password_confirmation)
  end

end