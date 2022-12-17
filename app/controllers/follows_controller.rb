class FollowsController < ApplicationController
  def allow
  
      binding.irb
      @request = Request.find(params[:acc_id])
      binding.irb
      @partner = Partner.find_by(certification_code: params[:request][:certification_code])
      @follow = current_user.follow.new(app_id: current_user, acc_id: @invite, certification_code: @partner.certification_code )
        #follow＿requestsコントローラーですが、parent_followsのnewメソッドです。
      @follow.save #parent_followに保存。
      @request.destroy # follow_requestは削除
      redirect_to partners_path
 
  end

def unallow
    @invite = User.find(@partner.mother_id)
    @invite.destroy
    redirect_to partners_path
end

end
