class UsersController < ApplicationController
  before_action :find_user, only: %i[show edit update]
  
  def index
    @users = User.all
    @users_se = SEUser.all
    @users_no = NOUser.all
  end

  def show; end
  
  def edit; end
  
  def update; end
  
  private
  
  def find_user
    @user = User.find(params[:id])
  end
end
