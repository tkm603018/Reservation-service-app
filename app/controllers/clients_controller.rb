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
    if params[:commit] == "サインイン"
      if client && client.authenticate(params[:client][:password])
        sign_in client
        redirect_to reservations_path, notice: 'ログイン中'
      else
        redirect_to reservations_path, notice: '未登録です'
      end
    elsif params[:commit] == "サインアップ"
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
