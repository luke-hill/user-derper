# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :find_user, only: %i[show edit update destroy]

  def index
    if params[:created_at_from] && params[:created_at_to]
      @users = User.where('date(created_at) between ? and ?', created_at_from, created_at_to).paginate(page: params[:page], per_page: 15)
    elsif params[:search]
      @users = User.search(params[:search]).paginate(page: params[:page], per_page: 15)
    else
      @users = User.all.paginate(page: params[:page], per_page: 15)
    end
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

  def destroy_multiple
    ids_to_delete = params[:user_ids].map do |kv|
      kv.first.to_i if kv.last['id'] == '1'
    end
    raise ids_to_delete.inspect #For now whilst we know this is still in theory broken!

    User.find(ids_to_delete).destroy
    redirect_to root_path
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

  def created_at_to
    Date.strptime(params[:created_at_to], '%m/%d/%Y')
  end

  def created_at_from
    Date.strptime(params[:created_at_from], '%m/%d/%Y')
  end
end
