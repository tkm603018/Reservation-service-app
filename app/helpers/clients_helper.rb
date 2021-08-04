module ClientsHelper
  def sign_in(client)
    session[:client_id] = client.id
  end

  def current_client
    if session[:client_id]
      @current_client ||= Client.find_by(id: session[:client_id])
    end
  end

  def current_client?(client)
    client == current_client
  end

  def signed_in?
    !current_client.nil?
  end

  def sign_out
    session.delete(:client_id)
    @current_client = nil
  end
end
