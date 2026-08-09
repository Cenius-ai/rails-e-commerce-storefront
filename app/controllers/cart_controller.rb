class CartController < ApplicationController
  before_action :find_product, only: [:add, :update, :remove]

  def show
    cart_ids = cart.keys.map(&:to_i)
    @products = Product.where(id: cart_ids).includes(:category).index_by(&:id)
    @cart_items = cart_ids.filter_map { |id|
      next unless @products[id]
      product = @products[id]
      qty = cart[id.to_s].to_i
      { product: product, quantity: qty, subtotal: product.price * qty }
    }
    @total = @cart_items.sum { |item| item[:subtotal] }
  end

  def add
    product_id = @product.id.to_s
    cart[product_id] = (cart[product_id] || 0) + 1
    redirect_to products_path, notice: "#{@product.name} added to cart."
  end

  def update
    product_id = @product.id.to_s
    qty = params[:quantity].to_i
    if qty > 0
      cart[product_id] = qty
    else
      cart.delete(product_id)
    end
    redirect_to cart_path, notice: "Cart updated."
  end

  def remove
    cart.delete(@product.id.to_s)
    redirect_to cart_path, notice: "#{@product.name} removed from cart."
  end

  private

  def find_product
    @product = Product.find(params[:product_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to products_path, alert: "Product not found."
  end
end
