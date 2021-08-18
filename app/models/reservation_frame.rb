class ReservationFrame < ApplicationRecord
  belongs_to :planner
  
  has_many :reservations, dependent: :destroy

  validates :planner_id, uniqueness: { scope: :reserved_at }
  validate :date_valid?
  validate :dow_valid?

  private
  
  def date_valid?
    errors.add(:reservation_frame, "日付を今日以降に設定してしてください") if reserved_at < Time.now
  end

  def dow_valid?
    errors.add(:reservation_frame, "日曜日は休業日です") if reserved_at.sunday?
  end
  
end
