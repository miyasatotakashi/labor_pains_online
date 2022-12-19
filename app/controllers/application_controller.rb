class ApplicationController < ActionController::Base
  private 

  def after_sign_in_path_for(resource)
    # blogs_path
    partners_path# ログイン後に遷移するpathを設定
  end
end
