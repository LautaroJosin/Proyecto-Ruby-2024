class ProductsController < ApplicationController

    def index
        @products = Product.all
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)

        # pp @product
        
        if @product.save
          redirect_to products_path, notice: 'Product saved correctly'
        else
            render :new, status: :unprocessable_entity
            #puts @product.errors.full_messages
        end
    end

    private 
    def product_params
      params.require(:product).permit(:name, :description, :price, :stock, :category_id, :size, :color, images: [] )
    end
end