class Client < ApplicationRecord
  has_many :sales, dependent: :restrict_with_error

  validates :phone, presence: true, format: { with: /\A(\+?\d{1,3}[-.\s]?)?(\(?\d{2,3}\)?[-.\s]?)?(\d{3}[-.\s]?\d{4})\z/, message: "must be a valid phone number" }
  validates :name, presence: true
  validates :lastname, presence: true
  validates :dni, presence: true, uniqueness: true, format: { with: /\A\d{8}\z/, message: "must have 8 digits" }
end
