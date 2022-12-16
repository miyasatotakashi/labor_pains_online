class RequestsController < ApplicationController
  def new
    @request = Request.new
  end

  def create
    @partner = Partner.find_by(certification_code: params[:request][:certification_code])
    @invite = User.find(@partner.mother_id)
    @request = Request.new(app_id: current_user, acc_id: @invite, certification_code: @partner.certification_code )
    @user = User.find(@partner.mother_id)
    @request.save
    redirect_to push_text_mains_path
  end

  def show
  end
end
