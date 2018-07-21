class HostsController < ApplicationController

  def new
    @host = Host.new
  end

  def create
    @host = Host.new(host_params)
    if @host.save
      session[:user_id] = @host.id
      redirect_to events_path
    else
      render :new
    end
  end

  def show
    redirect_to host_events_path(current_host)
  end

  private

  def host_params
    params.require(:host).permit(:name, :email, :password)
  end


end
