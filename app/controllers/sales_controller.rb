class SalesController < ApplicationController
  def index
    @sales = Sale.all
    authorize! :read, Sale
  end

  def new
    @product_amount = params[:products_amount].to_i

    if @product_amount <= 0 || @product_amount.nil?
      flash.now[:alert] = "Please select the number of products you want to include into the sale"
      render :set_products_amount
    else
      @sale = Sale.new
      authorize! :create, Sale
      @product_amount.times { @sale.product_sale.build }
    end
  end

  # This method is used to create a new sale in the following way:
  # 1. The sale will be created
  # 2. The stock of the products included in the sale will be updated
  # If any of the steps fails, the transaction will be rolled back
  def create
    authorize! :create, Sale
    ActiveRecord::Base.transaction do
      @sale = Sale.new(sale_params)

      if @sale.invalid?
        flash.now[:alert] = @sale.errors.full_messages.join(" | ")
        render :new
        return
      end

      total = @sale.product_sale.map { |ps| ps.product.price * ps.quantity }.sum
      @sale.total_price = total

      if @sale.save

        @sale.product_sale.each do |ps|
          product = ps.product
          product.update!(stock: product.stock - ps.quantity)
        end
        redirect_to sales_path, notice: "Sale saved correctly"
        return
      else
        raise ActiveRecord::Rollback
      end
    end

    flash.now[:alert] = "There was an error saving the sale: #{@sale.errors.full_messages.join(" | ")}"
    render :new
  end

  # This method is used to set the number of products that will be included into the sale
  def set_products_amount
    if request.get?
      @products_amount = 1

    elsif request.post?
      @products_amount = params[:products_amount].to_i

      if @products_amount <= 0
        flash.now[:alert] = "Please select a number greater than 0"
        render :set_products_amount
      else
        redirect_to new_sale_path(products_amount: @products_amount)
      end
    end
  end

  def cancel
    authorize! :update, Sale
    @sale = Sale.find(params[:id])
    if @sale.active == false
      return redirect_to sales_path, notice: "The sale is already canceled"
    end
    ActiveRecord::Base.transaction do
      @sale.update!(active: false)
      @sale.product_sale.each do |ps|
        product = ps.product
        product.update!(stock: product.stock + ps.quantity)
      end
    end
    redirect_to sales_path, notice: "Sale canceled and stock reverted"
  end

  private
  def sale_params
    params.require(:sale).permit(:user_id, :client_id, product_sale_attributes: [  :product_id, :quantity, :_destroy ])
  end
end
