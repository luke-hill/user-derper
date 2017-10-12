class Holiday < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  has_one :search, primary_key: :id, foreign_key: :search_id
  
  validates_presence_of :myb, :user_id, :search_id
end
