class Holiday < ApplicationRecord
  belongs_to :user, primary_key: :id, foreign_key: :user_id
  validates_presence_of :myb, :user_id, :search_id
end
