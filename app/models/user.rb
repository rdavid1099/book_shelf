class User < ApplicationRecord
  has_secure_password
  has_many :books

  validates :name,     presence: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  enum role: ["default", "admin"]
end
