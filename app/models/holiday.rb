class Holiday < ApplicationRecord
  validates_presence_of :myb, :user_id, :search_id
end
