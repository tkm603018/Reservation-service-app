class PlannersController < ApplicationController

  def index
    @planners = Planner.all
  end

  def show
    @planner = Planner.find(params[:id])
    @reservation_frames = ReservationFrame.after_current_time.status_ok.sort_reserved_at_asc
  end

  def new
  end

  def create
    planner = Planner.find_by(email: params[:planner][:email])
    return redirect_to new_planner_path, alert: '登録済です' if planner
    
    planner = Planner.new(
      email: params[:planner][:email],
      password: params[:planner][:password],
      password_confirmation: params[:planner][:password_confirmation]
    )
    if planner.valid?
      planner.save
      redirect_to reservation_frames_path, notice: '登録しました'
    else
      redirect_to reservation_frames_path, alert: planner.errors.messages
    end
  end
end
