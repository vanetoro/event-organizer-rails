class ApplicationController < ActionController::Base
  helper_method :current_user


  def welcome

  end

  def logged_in_and_set_host
      if host_logged_in?
      current_host
    end
  end

  def current_host
    @host ||= Host.find(session[:user_id])
  end

  def host_logged_in?
    !!current_host
  end
end
