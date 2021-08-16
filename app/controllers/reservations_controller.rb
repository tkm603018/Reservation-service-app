class ReservationsController < ApplicationController
  before_action :signed_in_client, only: [:new, :create]

  def index
  end

  def new
  end

  private

  def signed_in_client
    unless signed_in?
      flash[:alert] = "ログインするかユーザー登録してください"
      redirect_to reservations_path
    end
  end
end
