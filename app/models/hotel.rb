class Hotel < ApplicationRecord
  belongs_to :destination
  has_many :searches
  
  validates_presence_of :name, :destinations_id
end
