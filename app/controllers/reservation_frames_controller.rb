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

    @start_at = Time.local(2021, 1, 1, s[0].to_i, s[1].to_i)
    @end_at = Time.local(2021, 1, 1, e[0].to_i, e[1].to_i)
    
    if d.saturday?
      st = Time.local(2021, 1, 1, 11)
      en = Time.local(2021, 1, 1, 15)
      flash[:alert] = {time_frame: "予約日時が範囲外です"} if @start_at < st || @end_at > en
    end

    time_frame = TimeFrame.new(
      start_at: @start_at,
      end_at: @end_at
    )
    if time_frame.valid?
      time_frame.save
    else
      flash[:alert] = time_frame.errors.messages
    end

    reservation_frame = current_user.reservation_frames.build(
      time_frame_id: time_frame.id,
      reserved_date: d,
      status: args[:status],
    )
    if reservation_frame.valid?
      reservation_frame.save
    else
      flash[:alert] = reservation_frame.errors.messages
    end

    redirect_to new_reservation_frame_path, notice: !flash[:alert] && "登録しました"
  end
end
