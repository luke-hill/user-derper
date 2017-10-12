class Hotel < ApplicationRecord
  belongs_to :destination, foreign_key: :destinations_id
  validates_presence_of :name, :destinations_id
end
