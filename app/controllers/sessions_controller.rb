class SessionsController < ApplicationController
  
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user_path, notice: 'サインイン中'
    else
      redirect_to user_path, alert: '未登録です'
    end
  end

  def destroy
    sign_out
    if User.user_type(params[:id]).is_client?
      redirect_to reservations_path
    elsif User.user_type(params[:id]).is_planner?
      redirect_to reservation_frames_path
    end
  end

end
