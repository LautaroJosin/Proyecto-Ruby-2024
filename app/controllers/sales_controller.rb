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
    pp sale_params
  end


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
    params.require(:sale).permit(:date_time, :total_price)
  end
end
