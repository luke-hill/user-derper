class Search < ApplicationRecord
  belongs_to :user
  #belongs_to :hotel #Possibly broken?
  belongs_to :destination
  has_one :holiday
end
