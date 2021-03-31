class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :admin, :skill])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image, :header_image, :prefectures, :home_page, :industry, :employee, :average_age, :introduction, :admin, :skill])
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
