# frozen_string_literal: true

class RemoveDestIdIdFromHotels < ActiveRecord::Migration[5.1]
  def change
    remove_column :hotels, :dest_id, :int
  end
end
