class User < ApplicationRecord
  has_secure_password
  
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :type, presence: true
end
