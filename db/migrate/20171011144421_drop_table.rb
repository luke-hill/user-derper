class DropTable < ActiveRecord::Migration[5.1]
  def up
    drop_table :se_users
    drop_table :no_users
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
