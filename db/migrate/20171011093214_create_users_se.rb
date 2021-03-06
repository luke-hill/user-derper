# frozen_string_literal: true

class CreateUsersSe < ActiveRecord::Migration[5.1]
  def change
    create_table :se_users do |t|
      t.string :first_name
      t.string :surname
      t.string :email

      t.timestamps
    end
  end
end
