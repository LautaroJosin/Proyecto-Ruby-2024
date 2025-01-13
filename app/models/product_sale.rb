class ProductSale < ApplicationRecord
  belongs_to :sale
  belongs_to :product
  before_create :set_sale_price

  validates :quantity, presence: true, numericality: { greater_than: 0 }

  private
  def set_sale_price
    self.sale_price = self.product.price * self.quantity
  end
end
