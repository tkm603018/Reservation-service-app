class ReservationFrame < ApplicationRecord
  belongs_to :planner
  
  has_many :reservations, dependent: :destroy

  validates :planner_id, uniqueness: { scope: :reserved_at }
  validate :date_valid?
  validate :dow_valid?

  enum status: ["ng", "ok"]

  scope :active, -> { where(status: 1) }
  scope :filtered, -> { where('reserved_at > ?', Time.now) }
  scope :sorted, -> { sort{| a, b| a.reserved_at <=> b.reserved_at} }

  private
  
  def date_valid?
    errors.add(:reservation_frame, "日付を今日以降に設定してしてください") if reserved_at < Time.now
  end

  def dow_valid?
    errors.add(:reservation_frame, "日曜日は休業日です") if reserved_at.sunday?
  end
  
end
