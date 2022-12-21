class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :destroy]

  def new
    @user = User.new(user_params)
  end

  def show
  end

  def edit
  end

  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to user_path(@user.id)
      else
        render :new
      end
  end
  
  def update
    if @user.update(user_params)
      redirect_to user_path, notice: "投稿が更新しました"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: "投稿が削除されました。"
  end

  private


  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :hospital, :baby_name, :scheduled_date)
  end
end