class User < ApplicationRecord
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true
  enum state_id: {
    "Czech Republic": 0,
    "Slovakia": 1,
    "Great Britain": 2
  }
  enum role_id: {
    "admin": 0,
    "user": 1
  }
end
