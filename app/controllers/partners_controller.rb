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
      PartnerMailer.partner.mail(@partner).deliver
      redirect_to partner_path(@partner), notice: '招待コードを発行しました'
    else
      render :new
    end
  end
    # mother_id = params[:id]
    # @partner = Partner.new(mother_id: current_user, certification_code: SecureRandom.hex(10))
    # partner.check = true
  
    
  #   if @partner.save
  #     PartnerMailer.partner_mail(@partner).deliver
  #     # partnerMailer.partner_mail(@partner).deliver  ##追記
  #     redirect_to partners_path, notice: 'Partner was successfully created.'
  #   else
  #     render :new
  #   end
  # end

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

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_partner
    @partner = Partner.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def partner_params
    params.require(:partner).permit(:name, :email, :mother_id, :certification_code)
  end
end
