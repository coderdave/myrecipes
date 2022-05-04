class ChefChatRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chef_chat_room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
