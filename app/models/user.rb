class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation:true
  validates :type, presence: true

  class << self
    def user_type(id)
      return User.find(id).type
    end
  end
end
