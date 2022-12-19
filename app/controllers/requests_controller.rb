class RequestsController < ApplicationController

  def index
    @app_users = User.all
    @app_users = Request.where(acc_id:current_user.id).select(:app_id)
    # @app_users = User.where(id:[])
  end

  def new
    @request = Request.new
  end

  def create
    @partner = Partner.find_by(certification_code: params[:request][:certification_code])
    @invite = User.find(@partner.mother_id)
    @request = Request.new(app_id: current_user.id, acc_id: @invite.id, certification_code: @partner.certification_code )
    @user = User.find(@partner.mother_id)
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
