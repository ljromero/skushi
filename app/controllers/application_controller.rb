class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  #filter_parameter_logging :password
  
  # method to check the devel_id parameter received from a external API call
  def check_devel_id
    true  
  end
  
end
