require 'securerandom'

class PartnersController < ApplicationController
  before_action :set_partner, only: %i[ show edit update destroy ]

  # GET /partners or /partners.json
  def index
    @partners = Partner.all
  end

  # GET /partners/1 or /partners/1.json
  def show
  end

  # GET /partners/new
  def new
    @partner = Partner.new
    @certification_code = SecureRandom.hex(3)
  end

  # GET /partners/1/edit
  def edit
  end

  # POST /partners or /partners.json
  def create
    @partner = Partner.new(partner_params)
    
    if @partner.save
      PartnerMailer.partner_mail(@partner).deliver
      redirect_to partner_path(@partner), notice: 'Partner was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /partners/1 or /partners/1.json
  def update
    respond_to do |format|
      if @partner.update(partner_params)
        format.html { redirect_to partner_url(@partner), notice: "partner was successfully updated." }
        format.json { render :show, status: :ok, location: @partner }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /partners/1 or /partners/1.json
  def destroy
    @partner.destroy

    respond_to do |format|
      format.html { redirect_to partners_url, notice: "partner was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def allow
    # @requests = Request.where(acc_id: current_user.id)
    # @request = @requests.find_by(app_id: current_user.id)
    @partner = Partner.find_by(mother_id: current_user.id)
    @partner.partners_id = params[:partners_id]
    if  @partner.save
        # @request.destroy
        flash.notice = '承認しました'
    redirect_to mains_path
    end

    # @partner = Partner.find_by(certification_code: params[:request][:certification_code])
    # @follow = current_user.follow.new(app_id: current_user, acc_id: @invite, certification_code: @partner.certification_code )
      #follow＿requestsコントローラーですが、parent_followsのnewメソッドです。
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_partner
      @partner = Partner.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def partner_params
      params.require(:partner).permit(:id, :email, :mother_id, :partners_id, :certification_code )
    end
end
