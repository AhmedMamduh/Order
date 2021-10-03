class SessionsController < Devise::SessionsController

  def create
    user = User.find_by_email(sign_in_params[:email])

    if user && user.valid_password?(sign_in_params[:password])
      token = user.generate_jwt
      user.update(token: token)
      render json: user
    else
      msg = user.errors.full_messages.first ? user.errors.full_messages.first : "email or password is invalid"
      render json: { errors: msg }, status: :unprocessable_entity
    end
  end

  private
  def sign_in_params
    params.permit(:email, :password)
  end

end