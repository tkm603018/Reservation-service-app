module ReservationFramesHelper

  def def_time_frame
    a = Time.local(2021, 1, 1, 10)
    (0..15).map{|i| "#{t_format(a + 30.minute * i)}-#{t_format(a + 30.minute * (i+1))}"}
  end

  def t_format(x)
    x.strftime("%H:%M")
  end
end
