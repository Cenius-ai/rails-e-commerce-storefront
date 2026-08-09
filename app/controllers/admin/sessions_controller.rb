class Admin::SessionsController < ApplicationController
  def new
    redirect_to admin_products_path if admin_logged_in?
  end

  def create
    user = AdminUser.find_by(email: params[:email]&.strip&.downcase)
    if user&.authenticate(params[:password])
      session[:admin_user_id] = user.id
      redirect_to admin_products_path, notice: "Welcome back, Admin."
    else
      flash.now[:alert] = "Invalid email or password."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:admin_user_id] = nil
    redirect_to products_path, notice: "You have been logged out."
  end
end
