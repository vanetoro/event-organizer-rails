class SessionsController < ApplicationController

  def new
    binding.pry
    @host = Host.new
  end

  def  create
    @host = Host.find_by(email: params[:email])
    binding.pry
    if @host.authenticate(params[:password])
      redirect_to events_path
    else
      render :new
    end
  end
end
