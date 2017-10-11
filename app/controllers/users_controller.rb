class UsersController < ApplicationController
  before_action :find_user, only: %i[show edit update]
  
  def index
    @users = User.all
    @users_se = SEUser.all
    @users_no = NOUser.all
  end

  def show; end
  
  def edit; end
  
  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:first_name, :surname, :email)
  end
  
  def find_user
    @user = User.find(params[:id])
  end
end
