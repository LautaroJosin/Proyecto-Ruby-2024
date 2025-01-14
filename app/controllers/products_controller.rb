class ProductsController < ApplicationController
    def index
        @products = Product.all
        authorize! :read, Product
    end

    def show
        @product = Product.find_by(id: params[:id])
        if @product.nil?
            content_not_found
        end
        authorize! :read, @product
    end

    def new
        @product = Product.new
        authorize! :create, @product
    end

    def create
        @product = Product.new(product_params)
        authorize! :create, @product
        if @product.save
          redirect_to products_path, notice: "Product saved correctly"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
      @product = Product.find(params[:id])
      authorize! :edit, @product
    end

    # Fixme: This method is not updating the images of the product
    def update
        @product = Product.find_by(id: params[:id])
        if @product.update(product_params)
            redirect_to products_path, notice: "Product updated correctly"
        else
            flash.now[:alert] = "An error has ocurred when updating the product"
            render :edit, status: :unprocessable_entity
            nil
        end
    end


    def destroy
        @product = Product.find(params[:id])
        authorize! :destroy, @product
        @product.destroy
        redirect_to products_path, notice: "Product deleted correctly", status: :see_other
    end

    private
    def product_params
      params.require(:product).permit(:name, :description, :price, :stock, :category_id, :remove_image, :size, :color, images: [])
    end
end
