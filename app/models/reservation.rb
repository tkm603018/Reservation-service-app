class Reservation < ApplicationRecord
  belongs_to :client
  belongs_to :reservation_frame
  validates :client_id, uniqueness: { scope: :reservation_frame_id }
end
