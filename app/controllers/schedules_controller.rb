class SchedulesController < ApplicationController

  def index
    @Schedule = Schedule.joins(:user).select([:user_id,:date,:name,:description,:time,:id])


    if @Schedule
      render json: @Schedule
    else 
      render json: {status: :RecordNotFound}
    end 
  end

  def create
    @Schedule = Schedule.create(schedule_params)
    
    if @Schedule.valid?
      render json: {status: :ok}
    else
      render json: @Schedule.errors, status: :unprocessable_entity
    end
  end

  def update
      
    @Schedule = Schedule.find(params[:id])
    user_login = logged_in_user
    
    if @Schedule[:user_id] == user_login[:id]
      if @Schedule.update(schedule_params)
        render json: {status:   :ok}
      else
        render json: @Schedule.errors, status: :unprocessable_entity
      end
    else
      render json: {status: 405}
    end  
  end
  
  def destroy
    @Schedule = Schedule.find(params[:id])
    user_login = logged_in_user
    if @Schedule[:user_id] == user_login[:id]
      @Schedule.destroy
      render json: {status: :deleted}
    else 
      render json: {status: 405}
    end
  end

  private 
    def schedule_params
      params.permit(:user_id, :time, :date, :description)
    end
end
