class MainsController < ApplicationController
  def index
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
    # line_uid = User.where(partners_id: current_user.id).uid
    line_uid = User.find(Partner.find_by(mother_id: current_user.id).partners_id).uid
    
    response = client.push_message(line_uid, message)
    p response
    redirect_to mains_path
  end
end
