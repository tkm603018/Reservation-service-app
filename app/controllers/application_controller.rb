class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def signed_in_user
    unless signed_in?
      flash[:alert] = "ログインするかユーザー登録してください"
      if params[:controller] == "reservation_frames"
        redirect_to reservation_frames_path
      elsif params[:controller] == "reservations"
        redirect_to reservations_path
      end
    end
  end
end
