class Sale < ApplicationRecord
  before_create :set_date_and_time
  before_create :check_stock

  belongs_to :user
  belongs_to :client
  has_many :product_sale, dependent: :destroy
  has_many :product, through: :product_sale

  accepts_nested_attributes_for :product_sale, allow_destroy: true

  validates :user_id, presence: true
  validates :client_id, presence: true

  private

  def check_stock
    product_sale.each do |ps|
      product = ps.product
      if product.stock < ps.quantity
        errors.add(:base, "The product #{product.name} does not have enough stock")
        throw :abort
      end
    end
  end

  def set_date_and_time
    self.date_time = DateTime.now
  end
end
