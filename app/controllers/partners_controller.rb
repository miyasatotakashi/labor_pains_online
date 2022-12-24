require 'securerandom'

class PartnersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_partner, only: %i[ show edit update ]

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
      redirect_to partner_path(@partner), notice: '送信しました'
    else
      render :new
    end
  end

  # PATCH/PUT /partners/1 or /partners/1.json
  def update
    respond_to do |format|
      if @partner.update(partner_params)
        format.html { redirect_to partner_url(@partner), notice: "編集しました" }
        format.json { render :show, status: :ok, location: @partner }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /partners/1 or /partners/1.json
  def destroy
    @request = Request.find_by(app_id: params[:app_id])
    @request.destroy

    respond_to do |format|
      format.html { redirect_to partners_url, notice: "申請を拒否しました" }
      format.json { head :no_content }
    end
  end

  def allow
    @request = Request.find_by(app_id: params[:app_id])
    @partner = Partner.find_by(mother_id: current_user.id)
    @partner.partners_id = params[:app_id]
    if  @partner.save
        @request.destroy
        flash.notice = '承認しました。'
        redirect_to mains_path
    end
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
