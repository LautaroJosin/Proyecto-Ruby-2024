class ProductsController < ApplicationController

    def index
        @products = Product.all
    end

    def show
        @product = Product.find(params[:id])
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

    def edit
      @product = Product.find(params[:id])
    end

    # Fixme: This method is not updating the images of the product
    def update
        @product = Product.find(params[:id])

        if @product.update(product_params.except(:images))
            redirect_to products_path, notice: 'Product updated correctly'
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to products_path, notice: 'Product deleted correctly', status: :see_other
    end

    private 
    def product_params
      params.require(:product).permit(:name, :description, :price, :stock, :category_id, :size, :color, images: [] )
    end
    
end