class PagesController < ApplicationController
  def home
    if params[:category_id].present?
      @products = Product.where(category_id: params[:category_id])
    else
      @products = Product.all
    end

    if params[:search].present?
      @products = @products.where("LOWER(name) LIKE ? OR LOWER(description) LIKE ?", "%#{params[:search].downcase}%", "%#{params[:search].downcase}%")
    end

    @products = @products.where("stock > ?", 0)
  end
end
