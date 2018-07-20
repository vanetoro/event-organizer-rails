class HostsController < ApplicationController

  def new
    @host = Host.new
  end

  def create
    binding.pry
    @host = Host.new(host_params)
    redirect_to events_path
  end



  private

  def host_params
    params.require(:host).permit(:name, :email, :password)
  end


end
