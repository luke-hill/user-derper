class Hotel < ApplicationRecord
  validates_presence_of :name, :destinations_id
end
