class PlannersController < ApplicationController
  include PlannersHelper
  before_action :signed_in_planner, only:[:destroy]

  def index
  end

  def show
  end

  def new
  end

  def create
    planner = Planner.find_by(email: params[:planner][:email])
    if params[:commit] == "サインイン"
      if planner && planner.authenticate(params[:planner][:password])
        sign_in planner
        redirect_to reservation_frames_path, notice: 'ログイン中'
      else
        redirect_to reservation_frames_path, notice: '未登録です'
      end
    elsif params[:commit] == "SIGN UP"
      if planner
        redirect_to new_planner_path, notice: '登録済です'
      else
        Planner.create!(
          email: params[:planner][:email],
          password: params[:planner][:password]
        )
        redirect_to reservation_frames_path, notice: '登録しました'
      end
    end
  end

  def destroy
    sign_out
    redirect_to reservation_frames_path
  end

  private
  # ログイン済みユーザーかどうか確認
    def signed_in_planner
      unless signed_in?
        redirect_to new_planner_url
      end
    end
end
