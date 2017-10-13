class CreateLoginHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :login_histories do |t|
      t.integer :user_id
      t.timestamp :logged_in
      
      t.timestamps
    end
  end
end
