class Product < ApplicationRecord
    has_many_attached :images
    belongs_to :category

    # enum size: { S: 's', M: 'm', L: 'l', XL: 'xl', XXL: 'xxl'}

    validates :name , presence: true
    validates :price , presence: true
    validates :stock , presence: true
    validates :category, presence: true

    validate :must_have_at_least_one_image

    private
    def must_have_at_least_one_image
        unless images.attached?
            errors.add(:images, 'must have at least one image')
        end
    end
    
end
