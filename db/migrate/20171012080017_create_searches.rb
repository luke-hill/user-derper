class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.integer :destination_id
      t.integer :adults
      t.integer :children
      t.integer :infants
      t.date :departure_date
      t.integer :nights
      t.timestamp :searched_at
      t.integer :user_id, default: 'Not Logged In'

      t.timestamps
    end
  end
end
