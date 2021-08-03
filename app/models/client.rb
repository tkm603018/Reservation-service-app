class Client < User
  has_many :reservations, dependent: :destroy
end
