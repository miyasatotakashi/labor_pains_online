class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :configure_permitted_parameters, if: :devise_controller?

  private 

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:hospital, :baby_name, :scheduled_date])
  end

  def after_sign_in_path_for(resource)
    # blogs_path
    partners_path# ログイン後に遷移するpathを設定
  end
end