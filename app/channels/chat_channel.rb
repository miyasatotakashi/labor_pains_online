# frozen_string_literal: true

class ChatChannels < ApplicationCable::Channel
  CHANNEL_NAME = 'chat_channel'
  def subscribed
    # stream_from "some_channel"
    stream_from CHANNEL_NAME
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # Passing through the data by broadcast
  def receive(data)
    ActionCable.server.broadcast(CHANNEL_NAME, data)
  end
end