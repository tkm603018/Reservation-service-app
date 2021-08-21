class ReservationsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create]

  def index
  end

  def new
    m = ReservationFrame.all.filter{|a| 
          a.reserved_at > Time.now + 30.minute && a.status == "OK"
        }.sort{|a, b| 
          a.reserved_at <=> b.reserved_at
        }.map{|x| [
          id: x.id, 
          reserved_at: x.reserved_at, 
          planner_name: Planner.find(x.planner_id).name,
          reserved: Reservation.where(reservation_frame_id: x.id).present?
        ]}
    @reservation_frames = m.map{|m| m[0]}
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
