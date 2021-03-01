class CallCenterUsersController < ApplicationController
  def show
    @call_center_user = CallCenterUser.find(params[:id])
  end
end
