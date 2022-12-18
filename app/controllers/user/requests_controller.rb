class User::RequestsController < ApplicationController
  def index
    @pleases = current_user.requests.all
  end
end
