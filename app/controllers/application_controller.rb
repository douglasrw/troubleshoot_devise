class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected


  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name,:subdomain, :merchant, :password, :password_confirmation]
    devise_parameter_sanitizer.for(:account_update) << [:subdomain, :first_name, :last_name]
  end

  # we have two types of users so instead of authenticate_client! we will check
  # both
  def authenticate_all
    current_user || current_client || authenticate_client!
  end

end

