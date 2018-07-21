class ApplicationController < ActionController::Base
  helper_method :current_user


  def welcome

  end

  def current_host
    @host ||= Host.find(session[:user_id])
  end

  def host_logged_in?
    !!current_host
  end
end
