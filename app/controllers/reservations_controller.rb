class ReservationsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create]

  def index
  end

  def new
    m = []
    reserved_dates =  ReservationFrame.all.order(reserved_date: "ASC").map{|x| x.reserved_date}.uniq
    reserved_dates.map{|d| 
      m.concat(ReservationFrame.where(reserved_date: d).where(status: "OK").map{|a| [
      id: a.id, 
      reserved_date: a.reserved_date,
      start_at: a.time_frame.start_at,
      reserved: Reservation.where(reservation_frame_id: a.id).present?
      ]}.sort{|a, b| a[0][:start_at] <=> b[0][:start_at]})}
    @reservation_frames = m.map{|a| a[0]}
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
