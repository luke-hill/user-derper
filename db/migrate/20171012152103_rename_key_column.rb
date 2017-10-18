# frozen_string_literal: true

class RenameKeyColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :hotels, :destinations_id, :destination_id
  end
end
