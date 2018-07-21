class ApplicationController < ActionController::Base
  helper_method :current_user


  def welcome

  end

  def creating_or_editing_event
    if host_logged_in?
      @event = Event.new
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
