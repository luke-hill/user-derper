class Search < ApplicationRecord
  belongs_to :user
  #belongs_to :hotel #Possibly broken? - Monkeypatched in!
  belongs_to :destination
  has_one :holiday

  def hotel
    Hotel.find(hotel_id) if hotel_id
  end
end
