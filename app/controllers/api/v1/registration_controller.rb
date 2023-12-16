class Api::V1::RegistrationController < ApplicationController
  def create
    if email_exists(signapp_params[:email])
      render json: { error: 'Admin email already exists' }, status: :unproccessable_entity
    else
      admin = Admin.new(signapp_params)
      if admin.save
        render json: { message: 'Admin account successfully created' }, status: :ok
      else
        render json: { error: 'Something went wrong' }, status: :unproccessable_entity
      end
    end
  end

  protected

  def signapp_params
    params.require(:admin).permit(:username, :email, :password, :password_confirmation)
  end

  def email_exists(email)
    Admin.exists?(email: email)
  end
end