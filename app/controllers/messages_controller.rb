class MessagesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_room, only: [:create, :destroy]
  before_action :set_message, only: :destroy

  def create
    @message = Message.create(message_params)

    if @message.save
      @room.create_notification_message!(current_user, @message.id)
    end
  end

  def destroy
    @message = Message.find(params[:id])
    gets_entries_all_messages if @message.destroy
  end

   private

   def set_room
     @room = Room.find(params[:message][:room_id])
   end

   def set_message
     @message = Message.find(params[:id])
   end

   def gets_entries_all_messages
     @messages = @room.messages.includes(:user).order("created_at asc")
     @entries = @room.entries
   end

   def message_params
     params.require(:message).permit(:user_id, :message, :room_id).merge(user_id: current_user.id)
   end
end
