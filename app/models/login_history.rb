# frozen_string_literal: true

class LoginHistory < ApplicationRecord
  belongs_to :user

  validates :user_id, :logged_in, presence: true
end
