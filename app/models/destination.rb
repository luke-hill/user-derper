class Destination < ApplicationRecord
  has_many :hotels
  has_many :searches

  validates_presence_of :name
end
