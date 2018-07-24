class ApplicationController < ActionController::Base
  helper_method :current_host, :logged_in_and_set_host


  def welcome

  end


  def logged_in_and_set_host
      if host_logged_in?
      current_host
    end
  end

  def current_host
    @host ||= Host.find_by_id(session[:user_id])
  end

  def host_logged_in?
    !!current_host
  end



end
