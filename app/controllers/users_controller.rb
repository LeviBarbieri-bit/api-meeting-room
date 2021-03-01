class UsersController < ApplicationController
    before_action :authorized, only: [:auto_login]
  
    # REGISTER
    def create
      @user = User.create(user_params)

      if @user.valid?
        token = encode_token({user_id: @user.id})
        render json: {status: :created, token: token}
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    # LOGGING IN
    def login
      @user = User.find_by(email: params[:email])
  
      if @user && @user.authenticate(params[:password])
        token = encode_token({user_id: @user.id})
        render json: {status: "201", token: token}
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
  
    def auto_login
      render json: @user
    end
  
    private
  
    def user_params
      params.require(:users).permit(:email, :name, :password)
    end
  
end