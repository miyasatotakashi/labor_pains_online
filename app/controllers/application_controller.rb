class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  #以下のメソッドを記入
  def after_sign_in_path_for(resource)
     #遷移させたいページのpathを記述
     chat_channels_path
  end
end
