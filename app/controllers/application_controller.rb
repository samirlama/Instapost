class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 before_action :configure_permitted_parameters, if: :devise_controller?
 protected

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :name, :photo) }
  devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
  devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :name, :photo) }
end
 
 def after_sign_in_path_for(resource_or_scope)
  posts_path
end

def after_sign_out_path_for(resource_or_scope)
  new_user_session_path
end

end

