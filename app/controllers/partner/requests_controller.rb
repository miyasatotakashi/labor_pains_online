class Partner::RequestsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    please = current_partner.request.new(user_id: user.id, partner_id: current_partner.id)
    please.save
    redirect_back(fallback_location: partner_root_path) #同じページにリダイレクト。これは任意のページで。
  end

  def destroy
    user = User.find(params[:user_id])
    please = current_partner.request.new(user_id: user.id, partner_id: current_partner.id)
    please.destroy
    redirect_back(fallback_location: partner_root_path) #同じページにリダイレクト。これは任意のページで。
  end
end
