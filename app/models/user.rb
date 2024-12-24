require "bcrypt"

class User < ApplicationRecord
  include BCrypt
  belongs_to :role


  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true
  validates :join_date, presence: true
  has_secure_password
end
