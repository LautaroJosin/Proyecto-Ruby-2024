class PagesController < ApplicationController
  def home
    @products = Product.includes(:category, images_attachments: :blob)

    if params[:category_id].present?
      @products = @products.where(category_id: params[:category_id])
    end

    if params[:search].present?
      search_query = "%#{params[:search].downcase}%"
      @products = @products.where("LOWER(name) LIKE ? OR LOWER(description) LIKE ?", search_query, search_query)
    end

    @products = @products.where("stock > ?", 0)
  end
end
