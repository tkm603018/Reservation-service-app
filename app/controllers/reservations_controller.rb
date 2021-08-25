class ReservationsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create]

  def index
    reservation_frame_ids = Reservation.where(client_id: current_user&.id).pluck(:reservation_frame_id)
    @reservation_frames = ReservationFrame.after_current_time.status_ok.sort_reserved_at_asc.where(id: reservation_frame_ids)
  end

  def new
    @reservation_frames = ReservationFrame.after_current_time.status_ok.sort_reserved_at_asc
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

    redirect_to request.referer, notice: !flash[:alert] && "登録しました"
  end

  def destroy
    Reservation.find(params[:id]).delete
    redirect_to reservations_path, notice: '削除しました'
  end
end
