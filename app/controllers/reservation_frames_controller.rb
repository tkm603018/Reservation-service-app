class ReservationFramesController < ApplicationController

  def index
  end

  def new
  end

  def create
    flash[:alert] = "ログインするかユーザー登録してください" and return if !current_user

    args = params.require(:reservation_frame)
    d = Date.parse(args[:date])
    s = Time.parse(args[:start_at])
    e = Time.parse(args[:end_at])

    flash[:alert] = "日付を今日以降に設定してしてください" and return if d < Time.now

    @start_at = Time.local(d.year, d.month, d.day, s.hour, s.min, s.sec)
    @end_at = Time.local(d.year, d.month, d.day, e.hour, e.min, e.sec)
    dow = d.strftime('%a')
    
    if dow == 'Sat'
      st = Time.local(d.year, d.month, d.day, 11)
      en = Time.local(d.year, d.month, d.day, 15)
      check_time(st, en)
      round_time
    elsif dow == 'Sun'
      flash[:alert] = "日曜日は休業日です" and return
    else
      st = Time.local(d.year, d.month, d.day, 10)
      en = Time.local(d.year, d.month, d.day, 18)
      check_time(st, en)
      round_time
    end

    (1..reservation_frames_count).map{ |i| 
      time_frame = TimeFrame.new(
        start_at: @round_start_at + 30.minutes * (i-1),
        end_at: @round_start_at + 30.minutes * i
      )
      if time_frame.valid?
        time_frame.save
      else
        flash[:alert] = time_frame.errors.messages and return
      end

      reservation_frame = ReservationFrame.new(
        planner_id: current_user.id,
        time_frame_id: time_frame.id,
        date: d,
        status: args[:status],
      )
      if reservation_frame.valid?
        reservation_frame.save
      else
        flash[:alert] = reservation_frame.errors.messages and return
      end
    }

    redirect_to new_reservation_frame_path, notice: !flash[:alert] && "登録しました" and return
  end

  private

  def check_time(st, en)
    flash[:alert] = "予約日時が範囲外です" and return if @start_at < st && @end_at < en
  end

  def round_time
    if 0 < @start_at.min && @start_at.min < 30
      @round_start_at = @start_at.change(min: 30)
    elsif 30 < @start_at.min && @start_at.min <= 59
      @round_start_at = @start_at.change(hour: @start_at.hour + 1, min: 0)
    else
      @round_start_at = @start_at
    end

    if 0 < @end_at.min && @end_at.min < 30
      @round_end_at = @end_at.change(min: 0)
    elsif 30 < @end_at.min && @end_at.min <= 59
      @round_end_at = @end_at.change(min: 30)
    else
      @round_end_at = @end_at
    end

    flash[:alert] = "時間帯を正しく設定してください" and return if reservation_frames_count < 1
  end

  def reservation_frames_count
    (@round_end_at - @round_start_at)/1800
  end
end
