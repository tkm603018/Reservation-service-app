class ReservationFrame < ApplicationRecord
  belongs_to :planner
  belongs_to :time_frame
  
  validates :planner_id, uniqueness: { scope: :time_frame_id }
  
  has_many :reservations, dependent: :destroy
end
