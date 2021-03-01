class SchedulesController < ApplicationController

    def index
      @Schedule = Schedule.all

      if @Schedule
        render json: @Schedule
      else 
        render json: {status: :RecordNotFound}
      end 
    end

    def create
      @Schedule = Schedule.create(schedule_params)

      if @Schedule.valid?
        render json: {status: :created}
      else
        render json: @Schedule.errors, status: :unprocessable_entity
      end
    end

    private 
      def schedule_params
        params.permit(:users_id, :time, :date)
      end
    
end
