class ReservationsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create]

  def index
  end

  def new
    @reservation_frames = ReservationFrame.filtered.active.sorted
  end

  def create
    reservation = current_user.reservations.build(
      reservation_frame_id: params[:format]
    )
    
    if reservation.valid?
      reservation.save
    else
      flash[:alert] = reservation.errors.messages
    end

    redirect_to new_reservation_path, notice: !flash[:alert] && "登録しました"
  end
end
