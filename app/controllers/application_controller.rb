class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :config_auth, if: :devise_controller?

  def config_auth
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
