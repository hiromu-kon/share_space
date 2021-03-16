class MessagesController < ApplicationController
  def create
    if Entry.where(host_user_id: current_host_user.id, room_id: @room.id)
      @message = Message.create(message_params)
      if @message.save
        @message = Message.new
        gets_entries_all_messages
      end
    else
      flash[:alert] = "メッセージの送信に失敗しました"
    end
  end

  def update
    if @message.update(message_params)
      gets_entries_all_messages
    end
  end

  def destroy
    if @message.destroy
      gets_entries_all_messages
    end
  end

  private

  def set_room
    @room = Room.find(params[:message][:room_id])
  end

  def set_message
    @message = Message.find(params[:id])
  end

  def gets_entries_all_messages
    @messages = @room.messages.includes(:host_user).order("created_at asc")
    @entries = @room.entries
  end

  def message_params
    params.require(:message).permit(:host_user_id, :message, :room_id).merge(host_user_id: current_host_user.id)
  end
end
