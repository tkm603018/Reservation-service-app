class ClientsController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def create
    client = Client.find_by(email: params[:client][:email])
    if client
      redirect_to new_client_path, notice: '登録済です'
    else
      client = Client.new(
        email: params[:client][:email],
        password: params[:client][:password],
        password_confirmation: params[:client][:password_confirmation]
      )
      if client.valid?
        client.save!
        redirect_to reservations_path, notice: '登録しました'
      else
        redirect_to reservations_path, notice: client.errors.messages
      end
    end
  end

end
