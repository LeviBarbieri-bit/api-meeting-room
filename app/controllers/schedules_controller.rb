class SchedulesController < ApplicationController

  def index
    @Schedule = Schedule.joins(:user).select([:user_id,:schedule,:name,:description,:id])

    return render json: @Schedule if @Schedule
    render json: {status: :RecordNotFound}
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
    return render json: {status: :unauthorized}  if @Schedule['user_id'] != user_login[:id]
    return render json: {status: :ok}  if @Schedule.update(schedule_params)
    render json: @Schedule.errors, status: :unprocessable_entity    
  end
  
  def destroy
    @Schedule = Schedule.find(params[:id])
    user_login = logged_in_user
    return render json: {status: :unauthorized}  if @Schedule['user_id'] != user_login[:id]
    return  render json: {status: :deleted} if  @Schedule.destroy
  end

  private 
    def schedule_params
      params.permit(:user_id, :schedule, :description)
    end
     
end
