class ClientsController < ApplicationController
  include ClientsHelper
  before_action :signed_in_client, only:[:destroy]

  def index
  end

  def show
  end

  def new
  end

  def create
    client = Client.find_by(email: params[:client][:email])
    if params[:commit] == "SIGN IN"
      if client && client.authenticate(params[:client][:password])
        sign_in client
        redirect_to reservations_path, notice: 'ログイン中'
      else
        redirect_to reservations_path, notice: '未登録です'
      end
    elsif params[:commit] == "SIGN UP"
      if client
        redirect_to new_client_path, notice: '登録済です'
      else
        Client.create!(
          email: params[:client][:email],
          password: params[:client][:password]
        )
        redirect_to reservations_path, notice: '登録しました'
      end
    end
  end

  def destroy
    sign_out
    redirect_to reservations_path
  end

  private
  # ログイン済みユーザーかどうか確認
    def signed_in_client
      unless signed_in?
        redirect_to new_client_url
      end
    end
end
