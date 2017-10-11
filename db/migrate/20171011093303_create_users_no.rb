class CreateUsersNo < ActiveRecord::Migration[5.1]
  def change
    create_table :no_users do |t|
      t.string :first_name
      t.string :surname
      t.string :email

      t.timestamps
    end
  end
end
