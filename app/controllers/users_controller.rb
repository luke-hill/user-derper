class UsersController < ApplicationController
  def index
    @users = User.all
    @users_se = SEUser.all
    @users_no = NOUser.all
  end
end
