class Hotel < ApplicationRecord
  belongs_to :destination, foreign_key: :destinations_id
  has_many :searches, foreign_key: :hotel_id
  
  validates_presence_of :name, :destinations_id
end
