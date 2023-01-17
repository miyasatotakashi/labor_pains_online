class MainsController < ApplicationController

  def index
    @clocks = Clock.all
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
    line_uid = User.find(Partner.find_by(mother_id: current_user.id).partners_id).uid
    response = client.push_message(line_uid, message)
    p response
    
    # @jintsu_start_time = Clock.new(params[:start_time])
    @jintsu_start_time = DateTime.now
    
    # @jintsu_start_time.save
    # 陣痛の時間をDBにsaveする
    render :index
  end

end
