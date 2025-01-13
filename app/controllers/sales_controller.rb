class SalesController < ApplicationController
  def index
    @sales = Sale.all
  end

  def new
    @product_amount = params[:products_amount].to_i

    if @product_amount <= 0 || @product_amount.nil?
      flash[:alert] = "Please select the number of products you want to include into the sale"
      render :set_products_amount
    else
      @sale = Sale.new
      @product_amount.times { @sale.product_sale.build }
    end
  end

  def create
    ActiveRecord::Base.transaction do
      # Verificar si el cliente es nuevo o ya existe. Eliminar los parámetros de cliente si no se está creando uno nuevo
      if params[:sale][:client_id].blank?
        @client_params = params[:sale].slice(:name, :lastname, :dni, :phone)
        @client = Client.create!(@client_params)
        params[:sale][:client_id] = @client.id
        logger.info "New client created: #{@client.inspect}"
      else
        logger.info "Existing client selected: #{params[:sale][:client_id]}"
      end

      params[:sale].delete(:name)
      params[:sale].delete(:lastname)
      params[:sale].delete(:dni)
      params[:sale].delete(:phone)


      # Create sale
      @sale = Sale.new(sale_params)

      # Calcular el total y actualizar la venta
      total = @sale.product_sale.map { |ps| ps.product.price * ps.quantity }.sum
      @sale.total_price = total
      logger.info "Total calculated: #{@sale.total_price}"

      # Save the sale in the bd and updates the product's stock
      if @sale.save
        @sale.product_sale.each do |ps|
          product = ps.product
          product.update!(stock: product.stock - ps.quantity)
          redirect_to sales_path, notice: "Sale saved correctly"
        end
      else
        pp @sale.errors
        # flash.now[:alert] = "An error has ocurred when saving the sale"
        raise ActiveRecord::Rollback
      end
    end
  end


  # This method is used to set the number of products that will be included into the sale
  def set_products_amount
    if request.get?
      @products_amount = 1

    elsif request.post?
      @products_amount = params[:products_amount].to_i

      if @products_amount <= 0
        flash[:alert] = "Please select a number greater than 0"
        render :set_products_amount
      else
        redirect_to new_sale_path(products_amount: @products_amount)
      end
    end
  end

  private
  def sale_params
    params.require(:sale).permit(:user_id, :client_id, :name, :lastname, :dni, :phone, product_sale_attributes: [  :product_id, :quantity, :_destroy ])
  end
end
