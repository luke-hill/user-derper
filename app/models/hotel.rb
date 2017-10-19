# frozen_string_literal: true

class Hotel < ApplicationRecord
  belongs_to :destination
  has_many :searches

  validates :name, :destination_id, presence: true
end
