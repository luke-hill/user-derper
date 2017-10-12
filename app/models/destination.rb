class Destination < ApplicationRecord
  has_many :hotels, primary_key: :id, foreign_key: :destinations_id
  validates_presence_of :name
end
