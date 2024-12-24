class User < ApplicationRecord
  belongs_to :role

  has_secure_password # Requiere la gema bcrypt
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true
  validates :join_date, presence: true
end
