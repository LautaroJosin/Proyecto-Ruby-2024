class User < ApplicationRecord
  enum :role_int, admin: 0, manager: 1, employee: 2
  before_create :set_joined_at

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }

  validates :phone, presence: true, format: { with: /\A(\+?\d{1,3}[-.\s]?)?(\(?\d{2,3}\)?[-.\s]?)?(\d{3}[-.\s]?\d{4})\z/, message: "must be a valid phone number" }
  validates :role_int, inclusion: { in: role_ints.keys.map { |role| role.to_s }, message: "%{value} Role invalido." }

  def deactivate!
    update(is_active: false, password: Devise.friendly_token[0, 6])
  end

  def activate!
    update(is_active: true, password: "new-password")
  end

  def is_admin?
    role_int == "admin"
  end

  def is_manager?
    role_int == "manager"
  end

  def is_employee?
    role_int == "employee"
  end

  private
  def set_joined_at
    self.joined_at = Time.current unless joined_at
  end
end
