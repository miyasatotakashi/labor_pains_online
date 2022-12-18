class MainsController < ApplicationController
  def index
    @users = User.all
  end
    
  def push_text
    client ||= Line::Bot::Client.new { |config|
    config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
    config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }
    message = {
    type: 'text',
    text: "陣痛きたかも？"
    }
    partner = User.where(invited_by_id: current_user.id).uid
    
    response = client.push_message(partner, message)
    p response
    redirect_to mains_path
  end
end
