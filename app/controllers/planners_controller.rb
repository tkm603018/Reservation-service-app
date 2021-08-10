class PlannersController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def create
    planner = Planner.find_by(email: params[:planner][:email])
    if planner
      redirect_to new_planner_path, notice: '登録済です'
    else
      planner = Planner.new(
        email: params[:planner][:email],
        password: params[:planner][:password],
        password_confirmation: params[:planner][:password_confirmation]
      )
      if planner.valid?
        planner.save!
        redirect_to reservation_frames_path, notice: '登録しました'
      else
        redirect_to reservation_frames_path, alert: planner.errors.messages
      end
    end
  end

end
