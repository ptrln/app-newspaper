class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionHelper

  def require_login
    unless signed_in?
      flash[:error] = "you need to log in to do that"
      redirect_to new_session_url
    end
  end

end
