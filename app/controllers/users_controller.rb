# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :find_user, only: %i[show edit update destroy]

  def index
    @users = User.all.paginate(page: params[:page], per_page: 15)
  end

  def show
    @other_users = users_with_same_destination
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def users_with_same_destination
    user_ids_with_same_destination.uniq.map { |id| User.find(id) }
  end

  def user_ids_with_same_destination
    if find_user.last_location
      all_searches(find_user.last_location.id).map(&:user_id) - own_id
    else
      []
    end
  end

  def own_id
    [params[:id].to_i]
  end

  def all_searches(dest_id)
    Search.where(destination_id: dest_id)
  end

  def user_params
    params.require(:user).permit(:first_name, :surname, :email)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
