class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      root_path
    else
      user_path(current_user)
    end
  end

  #検索用
  def authenticate_any!
    if admin_signed_in?
        true
    else
        authenticate_user!
    end
  end

  private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:name, :email])
    end

end
