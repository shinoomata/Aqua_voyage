class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || super
  end
end
