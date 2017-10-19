# frozen_string_literal: true

class ChartsController < ApplicationController
  before_action :find_user, only: %i[user_search_history]

  def login_history
    render json: LoginHistory.group_by_day(:logged_in).count
  end

  def user_search_history
    render json: searches_by_day
  end

  private

  def searches_by_day
    @user.searches.group_by_day_of_week(:departure_date, format: '%a').count
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end
