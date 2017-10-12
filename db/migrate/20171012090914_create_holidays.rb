class CreateHolidays < ActiveRecord::Migration[5.1]
  def change
    create_table :holidays do |t|
      t.string :myb
      t.integer :user_id
      t.integer :search_id

      t.timestamps
    end
  end
end
