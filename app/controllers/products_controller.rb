class ProductsController < ApplicationController
  def index
    @products = Product.includes(:category).order(:name)
    @categories = Category.order(:name)
  end

  def show
    @product = Product.includes(:category).find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to products_path, alert: "Product not found."
  end
end
