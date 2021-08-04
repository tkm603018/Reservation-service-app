module PlannersHelper
  def sign_in(planner)
    session[:planner_id] = planner.id
  end

  def current_planner
    if session[:planner_id]
      @current_planner ||= Planner.find_by(id: session[:planner_id])
    end
  end

  def current_planner?(planner)
    planner == current_planner
  end

  def signed_in?
    !current_planner.nil?
  end

  def sign_out
    session.delete(:planner_id)
    @current_planner = nil
  end
end
