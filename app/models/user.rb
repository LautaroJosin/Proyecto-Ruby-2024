class User < ApplicationRecord
  enum :role_int, admin: 0, manager: 1, employee: 2
  # before_create :set_joined_at
  # before_update :check_if_active_changed

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Formato de email incorrecto." }
  validates :phone, presence: true, format: { with: /\A\d{6,10}\z/, message: "El telefono debe tener entre 6 y 10 numeros" }
  validates :role_int, inclusion: { in: role_ints.keys.map { |role| role.to_s }, message: "%{value} Role invalido." }
end
