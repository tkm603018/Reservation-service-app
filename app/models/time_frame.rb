class TimeFrame < ApplicationRecord
  has_many :reservation_frames, dependent: :destroy
end
