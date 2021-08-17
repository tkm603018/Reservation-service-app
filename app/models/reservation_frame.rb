class ReservationFrame < ApplicationRecord
  belongs_to :planner
  belongs_to :time_frame
  
  has_many :reservations, dependent: :destroy

  validates :planner_id, uniqueness: { scope: :time_frame_id }
  validate :date_valid?
  validate :dow_valid?

  private
  
  def date_valid?
    errors.add(:reservation_frame, "日付を今日以降に設定してしてください") if reserved_date < Time.now
  end

  def dow_valid?
    errors.add(:reservation_frame, "日曜日は休業日です") if reserved_date.sunday?
  end
  
end
