class Destination < ApplicationRecord
  has_many :hotels, foreign_key: :destinations_id
  has_many :searches, foreign_key: :destination_id
  
  validates_presence_of :name
end
