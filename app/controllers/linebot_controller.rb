require 'line/bot'

class LinebotController < ApplicationController

  protect_from_forgery :except => [:callback]

  def client
    client ||= Line::Bot::Client.new { |config|
    config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
    config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }
  end

  def callback
    body = request.body.read
    signature = request.env['HTTP_X_LINE_SIGNATURE']
    unless client.validate_signature(body, signature)
    error 400 do 'Bad Request' end
  end

    events = client.parse_events_from(body)
    events.each do |event|
      case event
        when Line::Bot::Event::Follow
          userId = event['source']['userId'] 
          User.find_or_create_by(uid: userId)
        when Line::Bot::Event::Unfollow
          userId = event['source']['userId']  
          user = User.find_by(uid: userId)
          user.destroy if user.present?
        end
      end
    "OK"
  end
end
