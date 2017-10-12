class Search < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  belongs_to :hotel, foreign_key: :hotel_id
  belongs_to :destination, foreign_key: :destination_id

end
