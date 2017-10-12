class Holiday < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  #Last TBD
  
  validates_presence_of :myb, :user_id, :search_id
end
