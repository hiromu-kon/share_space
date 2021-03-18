module RoomsHelper
  def opened_host_user(room)
    entry = room.entries.where.not(host_user_id: current_host_user)
    entry[0].host_user
  end

  def get_most_new_message(room)
    last_message = room.messages.order(created_at: :desc).limit(1)
    last_message[0]
  end
end
