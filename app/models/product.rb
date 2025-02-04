class Product < ApplicationRecord
    has_many_attached :images
    belongs_to :category

    validates :name, presence: true
    validates :price, presence: true, numericality: { greater_than: 0, message: "must be a positive number" }
    validates :stock, presence: true, numericality: { greater_than_or_equal_to: 0, message: "must be zero or a positive number" }
    validates :category, presence: true
    validates :images, content_type: [ "image/png", "image/jpeg" ]

    validate :must_have_at_least_one_image, on: :create

    def soft_delete
        self.update(stock: 0, deleted_at: DateTime.now)
    end

    private
    def must_have_at_least_one_image
        unless images.attached?
            errors.add(:product, "must have at least one image")
        end
    end
end
