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
    if @Schedule.update(schedule_params)
      render json: {status: :updated}
    else
      render json: @Schedule.errors, status: :unprocessable_entity
    end
  end
  
  def destroy
    @Schedule = Schedule.find(params[:id])
    @Schedule.destroy
    render json: {status: :deleted}
  end

  private 
    def schedule_params
      params.permit(:user_id, :time, :date, :description)
    end
end
