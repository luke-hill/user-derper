# frozen_string_literal: true

class ChartsController < ApplicationController
  before_action :find_user, only: %i[search_history_by_day search_history_by_month]

  def login_history
    render json: LoginHistory.group_by_day(:logged_in).count
  end

  def search_history_by_day
    render json: searches_by_day
  end

  def search_history_by_month
    render json: searches_by_month
  end

  private

  def searches_by_day
    @user.searches.group_by_day_of_week(:departure_date, format: '%a').count
  end

  def searches_by_month
    @user.searches.group_by_month(:departure_date, format: '%B').count
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end
