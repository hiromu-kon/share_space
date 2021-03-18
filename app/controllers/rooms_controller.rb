class RoomsController < ApplicationController
  def index
    @rooms = current_host_user.rooms.joins(:messages).includes(:messages).order("messages.created_at desc")
  end

  def create
    @room = Room.create
    @joinCurrentUser = Entry.create(host_user_id: current_host_user.id, room_id: @room.id)
    @joinUser = Entry.create(join_room_params)
    redirect_to room_path(@room.id)
  end

  def show
    @room = Room.find(params[:id])
    if Entry.where(host_user_id: current_host_user.id, room_id: @room.id).present?
      @messages = @room.messages.includes(:host_user).order("created_at asc")
      @message = Message.new
      @entries = @room.entries.includes(:host_user)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def join_room_params
    params.require(:entry).permit(:host_user_id, :room_id).merge(room_id: @room.id)
  end

end
