class LoginHistory < ApplicationRecord
  belongs_to :user

  validates_presence_of :user_id, :logged_in
end
