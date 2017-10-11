class UsersController < ApplicationController
  before_action :find_user, only: %i[show edit update]

  def index
    @users = User.all
    @uk_users = uk_users
    @se_users = se_users
    @no_users = no_users
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
  
  def uk_users
    User.all.where(domain: 'uk')
  end
  
  def se_users
    User.all.where(domain: 'se')
  end

  def no_users
    User.all.where(domain: 'no')
  end

  def user_params
    params.require(:user).permit(:first_name, :surname, :email)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
