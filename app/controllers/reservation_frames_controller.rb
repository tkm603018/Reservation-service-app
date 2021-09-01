class ReservationFramesController < ApplicationController
  before_action :signed_in_user, only: [:new, :create]

  def index
  end

  def new
  end

  def create
    args = params.require(:reservation_frame)
    d = Date.parse(args[:reserved_date])
    t = args[:time_frame].split("-")
    s = t[0].split(":")
    e = t[1].split(":")

    @start_at = Time.local(d.year, d.month, d.day, s[0].to_i, s[1].to_i)
    @end_at = Time.local(d.year, d.month, d.day, e[0].to_i, e[1].to_i)
    
    if d.saturday?
      st = Time.local(d.year, d.month, d.day, 11)
      en = Time.local(d.year, d.month, d.day, 14, 30)
      flash[:alert] = '予約日時が範囲外です' if @start_at < st || @start_at > en
    end

    reservation_frame = current_user.reservation_frames.build(
      reserved_at: @start_at,
      status: args[:status],
    )
    if reservation_frame.valid?
      reservation_frame.save
    else
      flash[:alert] = reservation_frame.errors.messages
    end

    redirect_to new_reservation_frame_path, notice: !flash[:alert] && '登録しました'
  end

  def update
    reservation_frame = ReservationFrame.find(params[:id])
    if reservation_frame.status_ok?
      reservation_frame.status_ng!
    else
      reservation_frame.status_ok!
    end
      redirect_to reservation_frames_path, notice: '表示を切り替えました'
  end

  def destroy
    ReservationFrame.find(params[:id]).destroy
    redirect_to reservation_frames_path, notice: '削除しました'
  end
end
