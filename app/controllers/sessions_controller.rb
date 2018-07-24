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


  def create_google

    @host = Host.find_or_create_by(email: auth[:info][:email]) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.password = SecureRandom.hex
      binding.pry
      @host.save
    end

    session[:user_id] = @host.id
    redirect_to host_events_path(@host)
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

  private

  def auth
  request.env['omniauth.auth']
  end

end
