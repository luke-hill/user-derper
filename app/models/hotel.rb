class Hotel < ApplicationRecord
  belongs_to :destination
  has_many :searches
  
  validates_presence_of :name, :destination_id
end
