class Holiday < ApplicationRecord
  belongs_to :user
  belongs_to :search
  
  validates_presence_of :myb, :user_id, :search_id
end
