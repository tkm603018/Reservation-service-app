class ReservationsController < ApplicationController
  before_action :signed_in_client, only: [:new, :create]

  def index
  end

  def new
  end
end
