class NOUser < ApplicationRecord
  validates_presence_of :first_name, :surname, :email
end
