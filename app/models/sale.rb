class Sale < ApplicationRecord
  before_create :set_date_and_time
  before_create :check_stock

  belongs_to :user
  belongs_to :client

  has_many :product_sale, dependent: :destroy
  has_many :product, through: :product_sale

  accepts_nested_attributes_for :product_sale, allow_destroy: true

  validates :user_id, :client_id, presence: true
  validates :total_price, presence: true, numericality: { greater_than: 0 }

  private

  def check_stock
  end

  def set_date_and_time
    self.date_time = DateTime.now
  end
end
