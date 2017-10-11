class UsersController < ApplicationController
  def index
    @users = User.all
    @users_se = UserSE.all
    @users_no = UserNO.all
  end
end
