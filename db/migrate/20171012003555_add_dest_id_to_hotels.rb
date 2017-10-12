class AddDestIdToHotels < ActiveRecord::Migration[5.1]
  def change
    add_reference :hotels, :destinations, foreign_key: true
  end
end
