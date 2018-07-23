class SessionsController < ApplicationController

  def new
    if session[:user_id]
      current_host
      binding.pry
      redirect_to host_events_path(current_host)
    else
      @host = Host.new
    end
  end

  def  create
    @host = Host.find_by(email: params[:host][:email])
    if @host.authenticate(params[:host][:password]) && !@host.nil?
      session[:user_id] = @host.id
      redirect_to host_events_path(@host)
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to new_session_path
  end
end
