class HostsController < ApplicationController
layout 'logged_in', only: [:index, :show , :edit]
before_action :unauthorized, only: [:edit]

  def new
    @host = Host.new
  end

  def create
    @host = Host.new(host_params)
    if @host.save
      session[:user_id] = @host.id
      redirect_to host_events_path(@host)
    else
      render :new
    end
  end

  def edit

  end

  def show
    redirect_to host_events_path(current_host)
  end

  def update
    if host_logged_in?
      @host = Host.find_by(id: params[:id])
      @host.update(host_params)
      if @host.save
        redirect_to host_events_path(@host)
      end
      redirect_to  new_session_path
    end
  end

  private

  def host_params
    params.require(:host).permit(:name, :email, :password)
  end


end
