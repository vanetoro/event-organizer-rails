class SessionsController < ApplicationController

  def new
    @host = Host.new
  end

  def  create
    @host = Host.find_by(email: params[:host][:email])
    if @host.authenticate(params[:host][:password])
      session[:user_id] = @host.id
      redirect_to events_path
    else
      render :new
    end
  end
end
