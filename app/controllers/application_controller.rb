class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :is_xhr?
  
  def is_xhr?
    request.xhr?
  end
end
