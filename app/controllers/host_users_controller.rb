class HostUsersController < ApplicationController
  def show
    @host_user = HostUser.find(params[:id])
  end
end
