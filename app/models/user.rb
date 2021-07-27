class User < ApplicationRecord

  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
  validates :type, presence: true
end
