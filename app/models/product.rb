class Product < ApplicationRecord
    has_many_attached :images

    belongs_to :category

    enum size: {
        S: 's',
        M: 'm',
        L: 'l', 
    }

    validates: :title , presence: true
    validates: :price , presence: true
    validates: :stock , presence: true
    validates :category, presence: true

    validates: :size , presence: false
    validates: :deleted_at , presence: false
    validate :must_have_at_least_one_image

    private
    def must_have_at_least_one_image
        if images.empty?
        errors.add(:images, 'must have at least one image')
        end
    end
    
end
