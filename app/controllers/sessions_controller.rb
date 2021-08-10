class SessionsController < ApplicationController
  
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user_path, notice: 'ログイン中'
    else
      redirect_to user_path, notice: '未登録です'
    end
  end

  def destroy
    sign_out
    type = User.find(params[:id]).type
    if type == 'Client'
      redirect_to reservations_path
    elsif type == 'Planner'
      redirect_to reservation_frames_path
    end
  end

  private
  def user_path
    if current_user.type == 'Client'
      return reservations_path
    elsif current_user.type == 'Planner'
      return reservation_frames_path
    end
  end

end
