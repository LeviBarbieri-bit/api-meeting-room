class UsersController < ApplicationController
    before_action :authorized, only: [:auto_login]

    # show all register user
    def index
      @user = User.all

      if @user
        render json: @user
      else 
        render json: {status: :RecordNotFound}
      end 
    end

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
    
    def destroy
      @user = User.find(params[:id])
      @user.destroy
      render json: {status: :ok}
    end

    # LOGGING IN
    def login
      @user = User.find_by(email: params[:email])
  
      if @user && @user.authenticate(params[:password])
        token = encode_token({user_id: @user.id})
        render json: {status: :ok, token: token}
      else
        render json: {error: "Invalid email or password"}
      end
    end
    
  
    def auto_login
      render json: @user
    end
  
    private def user_params
      params.require(:users).permit(:email, :name, :password)
    end
  
end