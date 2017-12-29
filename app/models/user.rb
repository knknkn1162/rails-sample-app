class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
   presence: true,
   length: { maximum: 255 },
   uniqueness: { case_sensitive: false }
  # use password and password_confirmation attribute & authenticate method
  has_secure_password

  validates :password, presence: true, length: { minimum: 6 }
end
