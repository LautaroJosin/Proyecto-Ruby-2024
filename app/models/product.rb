class Product < ApplicationRecord
    has_many_attached :images
    belongs_to :category

    enum size: {
        S: 's',
        M: 'm',
        L: 'l', 
    }
end
