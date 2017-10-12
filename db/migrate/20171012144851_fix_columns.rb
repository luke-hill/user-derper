class FixColumns < ActiveRecord::Migration[5.1]
  def change
    add_column :searches, :hotel_id, :integer
    add_column :searches, :holiday_type, :string
  end
end
