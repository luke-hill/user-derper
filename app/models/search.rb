class Search < ApplicationRecord
  belongs_to :user
  belongs_to :hotel
  belongs_to :destination
  has_one :holiday
end
