class Api::V1::AuthenticationController < ApplicationController
  def create
    admin = Admin.find_by(email: params[:admin][:email])
    if admin&.authenticate(params[:admin][:password])
      render json: {
        message: 'Admin logged in successfully',
        admin: AdminSerializer.new(admin),
        token: JsonWebToken.encode({sub: admin.id}),
      }, status: :ok
    else
      render json: {error: 'Invalid Credentials'}, status: :unauthorized
    end
  end
end