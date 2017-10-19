# frozen_string_literal: true

class ChartsController < ApplicationController
  def login_histories
    render json: LoginHistory.group_by_day(:logged_in).count
  end
end
