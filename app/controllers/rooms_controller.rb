class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :room_mached?, only: [:show]

  def index
    @rooms = current_user.rooms.joins(:messages).includes(:messages).order("messages.created_at desc")
  end

  def create
    @room = Room.create
    @joinCurrentUser = Entry.create(user_id: current_user.id, room_id: @room.id)
    @joinUser = Entry.create(join_room_params)
    redirect_to room_path(@room.id)
  end

  def show
    @room = Room.find(params[:id])
    if Entry.where(user_id: current_user.id, room_id: @room.id).present?
      @messages = @room.messages.includes(:user).order("created_at asc")
      @message = Message.new
      @entries = @room.entries.includes(:user)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def join_room_params
    params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id)
  end

  def room_mached?
    room = Room.find(params[:id])
    check_entry = Entry.where("room_id = #{room.id} && user_id = #{current_user.id}")

    if check_entry.empty?
      flash[:danger] = '不正な操作です。'
      redirect_to rooms_path
    end
  end
end
