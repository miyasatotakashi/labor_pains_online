class RequestsController < ApplicationController

  def index
    @request = current_user.request.all
  end

  def new
    @request = Request.new
  end

  def create
    @partner = Partner.find_by(certification_code: params[:request][:certification_code])
    binding.irb
    @invite = User.find(@partner.mother_id)
    @request = Request.new(app_id: current_user, acc_id: @invite, certification_code: @partner.certification_code )
    @user = User.find(@partner.mother_id)
    @request.save
    redirect_to partners_path
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
   
    # @partner = Partner.find_by(certification_code: params[:request][:certification_code])
    # @invite = User.find(@partner.mother_id)
  end
  private

  def request_params
    params.require(:request).permit(:certification_code)
  end

end
