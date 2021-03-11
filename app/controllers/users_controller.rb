class UsersController < ApplicationController
    before_action :authorized, only: [:auto_login]

    # REGISTER
    def create
      @user = User.create(user_params)

      if @user.valid?
        token = encode_token({user_id: @user.id})
        render json: {status: :created, token: token, user: @user}
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # LOGGING IN
    def login
      @user = User.find_by(email: params[:email])
  
      if @user && @user.authenticate(params[:password])
        token = encode_token({user_id: @user.id})
        render json: {status: :ok, token: token, user: @user}
      else
        render json: {}, status: :not_found
      end
    end
    
  
    def auto_login
      render json: @user
    end
  
    private def user_params
      params.permit(:email, :name, :password)
    end
  
end