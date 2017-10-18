# frozen_string_literal: true

class AddDomainToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :domain, :string
  end
end
