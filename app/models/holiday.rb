# frozen_string_literal: true

class Holiday < ApplicationRecord
  belongs_to :user
  belongs_to :search

  validates :myb, :user_id, :search_id, presence: true
end
