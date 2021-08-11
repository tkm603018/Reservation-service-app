class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation:true
  validates :type, presence: true

  class << self
    def user_type(id)
      User.find(id)
    end
  end

  def is_client?
    type == 'Client'
  end

  def is_planner?
    type == 'Planner'
  end
end
