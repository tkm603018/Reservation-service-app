class ApplicationController < ActionController::Base
  include SessionsHelper

  def signed_in_client
    unless signed_in?
      flash[:alert] = "ログインするかユーザー登録してください"
      redirect_to reservations_path
    end
  end

  def signed_in_planner
    unless signed_in?
      flash[:alert] = {user: "ログインするかユーザー登録してください"}
      redirect_to reservation_frames_path
    end
  end
end
