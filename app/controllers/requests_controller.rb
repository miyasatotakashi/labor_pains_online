class RequestsController < ApplicationController

  def index
  end

  def new
    @request = Request.new
  end

  def create
    @partner = Partner.find_by(certification_code: params[:request][:certification_code])
    @invite = User.find(@partner.mother_id)
    @request = Request.new(app_id: current_user, acc_id: @invite, certification_code: @partner.certification_code )
    @user = User.find(@partner.mother_id)
    binding.irb
    if @request.save
      flash.notice = '承認申請を送りました'
      redirect_to partners_path
    else
      render :new
    end
  end

  def destroy
    @partner = Partner.find_by(certification_code: params[:request][:certification_code])
    @invite = User.find(@partner.mother_id)
    @request = Request.new(app_id: current_user, acc_id: @invite, certification_code: @partner.certification_code )
    @user = User.find(@partner.mother_id)
    @request.destroy
    redirect_to partners_path
  end

 
  def show
    @partner = Partner.find_by(certification_code: params[:request][:certification_code])
    @invite = User.find(@partner.mother_id)
  end

  def allow
    binding.irb
    @request = Request.find(params[:acc_id])
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

  private

  def request_params
    params.require(:request).permit(:certification_code, :app_id, :acc_id)
  end

end
