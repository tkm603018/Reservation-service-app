class ReservationFrame < ApplicationRecord
  belongs_to :planner
  
  has_many :reservations, dependent: :destroy

  validates :planner_id, uniqueness: { scope: :reserved_at }
  validate :date_valid?
  validate :dow_valid?

  enum status: ["ng", "ok"], _prefix: true

  scope :after_current_time, -> { where('reserved_at > ?', Time.now) }
  scope :sort_reserved_at_asc, -> { order(reserved_at: "ASC") }

  private
  
  def date_valid?
    errors.add(:reservation_frame, "日付を今日以降に設定してしてください") if reserved_at < Time.now
  end

  def dow_valid?
    errors.add(:reservation_frame, "日曜日は休業日です") if reserved_at.sunday?
  end
  
end
