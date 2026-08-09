class ApplicationController < ActionController::Base
  helper_method :cart_items_count, :admin_logged_in?

  private

  def cart
    session[:cart] ||= {}
  end

  def cart_items_count
    cart.values.map(&:to_i).sum
  end

  def admin_logged_in?
    session[:admin_user_id].present?
  end

  def current_admin
    @current_admin ||= AdminUser.find_by(id: session[:admin_user_id]) if session[:admin_user_id]
  end
end
