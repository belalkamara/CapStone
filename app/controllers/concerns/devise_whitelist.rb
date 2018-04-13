module DeviseWhitelist
  extend ActiveSupport::Concern

  included do
    before_action :config_auth, if: :devise_controller?
  end
  
  def config_auth
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end