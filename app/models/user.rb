class User < ApplicationRecord
  enum :role_int, admin: 0, manager: 1, employee: 2
  # before_create :set_joined_at
  # before_update :check_if_active_changed

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  validates :phone, presence: true
  validates :role_int, inclusion: { in: role_ints.keys.map { |role| role.to_s }, message: "%{value} Role invalido." }

  def deactivate!
    update(is_active: false, password: Devise.friendly_token[0, 6])
  end
end
