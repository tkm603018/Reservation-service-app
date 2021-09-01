module SessionsHelper
  def sign_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    session.delete(:user_id)
    @current_user = nil
  end

  def user_root_path
    if current_user.is_client?
      reservations_path
    elsif current_user.is_planner?
      reservation_frames_path
    end
  end

  def users_path
    "/#{current_user.type.downcase}s"
  end

  def user_path
    "#{users_path}/#{current_user.id}"
  end
end
