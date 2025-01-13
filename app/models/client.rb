class Client < ApplicationRecord
  has_many :ventas

  validates :phone, presence: true
  validates :name, presence: true
  validates :lastname, presence: true
  validates :dni, presence: true, uniqueness: true
end
