class Planner < User
  has_many :reservation_frames, dependent: :destroy
end
