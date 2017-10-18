# frozen_string_literal: true

class Destination < ApplicationRecord
  has_many :hotels
  has_many :searches

  validates :name, presence: true
end
