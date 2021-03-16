class HostUsersController < ApplicationController
  def show
    @host_user = HostUser.find(params[:id])
    if host_user_signed_in?
      @currentHostUserEntry = Entry.where(host_user_id: current_host_user.id)
      @hostUserEntry = Entry.where(host_user_id: @host_user.id)
      unless @host_user.id == current_host_user.id
        @currentHostUserEntry.each do |cu|
          @hostUserEntry.each do |u|
            if cu.room_id == u.room_id
              @haveRoom = true
              @roomId = cu.room_id
            end
          end
        end
        unless @haveRoom
          @room = Room.new
          @entry = Entry.new
        end
      end
    end
  end
end
