class CreateTables < ActiveRecord::Migration[5.1]
  def up
    create_table :hotels do |t|
      t.string  :name
      t.integer :dest_id
      t.timestamps
    end
    create_table :destinations do |t|
      t.string :name
      t.timestamps
    end
  end

end
