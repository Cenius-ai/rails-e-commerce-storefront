class Admin::BaseController < ApplicationController
  before_action :require_admin

  private

  def require_admin
    unless admin_logged_in?
      redirect_to admin_login_path, alert: "Please log in to access the admin area."
    end
  end
end
