class OrdersController < ApplicationController
  def new
    cart_ids = cart.keys.map(&:to_i)
    if cart_ids.empty?
      redirect_to cart_path, alert: "Your cart is empty."
      return
    end

    @products = Product.where(id: cart_ids).includes(:category).index_by(&:id)
    @cart_items = cart_ids.filter_map { |id|
      next unless @products[id]
      product = @products[id]
      qty = cart[id.to_s].to_i
      { product: product, quantity: qty, subtotal: product.price * qty }
    }
    @total = @cart_items.sum { |item| item[:subtotal] }
    @order = Order.new
  end

  def create
    cart_ids = cart.keys.map(&:to_i)
    if cart_ids.empty?
      redirect_to cart_path, alert: "Your cart is empty."
      return
    end

    products = Product.where(id: cart_ids).index_by(&:id)

    ActiveRecord::Base.transaction do
      total = cart_ids.sum { |id|
        (products[id]&.price || 0) * cart[id.to_s].to_i
      }

      @order = Order.new(order_params)
      @order.total = total
      @order.status = "confirmed"

      cart_ids.each do |id|
        product = products[id]
        next unless product
        qty = cart[id.to_s].to_i
        next if qty <= 0
        @order.line_items.build(
          product: product,
          quantity: qty,
          price: product.price
        )
      end

      @order.save!
      session[:cart] = {}
      session[:order_ids] ||= []
      session[:order_ids] << @order.id
    end

    redirect_to order_path(@order), notice: "Order confirmed! Thank you for your purchase."
  rescue ActiveRecord::RecordInvalid => e
    flash.now[:alert] = "There was a problem with your order: #{e.message}"
    render :new, status: :unprocessable_entity
  end

  def show
    order_id = params[:id].to_i
    unless session[:order_ids]&.include?(order_id)
      redirect_to products_path, alert: "Order not found."
      return
    end
    @order = Order.includes(line_items: :product).find(order_id)
  rescue ActiveRecord::RecordNotFound
    redirect_to products_path, alert: "Order not found."
  end

  private

  def order_params
    params.require(:order).permit(:name, :email)
  end
end
