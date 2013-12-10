class Clients::RegistrationsController < Devise::SessionsController
  before_filter :configure_permitted_parameters
end
