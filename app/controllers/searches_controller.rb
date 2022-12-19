class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @partner = Partner.find(params[:id])
    if params[:partner].present?
      if params[:partner][:certification_code].present?
        @partner = current_user.partner.certification_code_search(params[:partner][:certification_code])
      end
    end
  end

end