class UsersController < ApplicationController

  def index
    @users = User.all
    @users_se = SEUser.all
    @users_no = NOUser.all
  end

  def show
    @user = User.find(params[:id])
  end

end
