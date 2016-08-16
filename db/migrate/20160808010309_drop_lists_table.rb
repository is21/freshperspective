class DropListsTable < ActiveRecord::Migration
  def up
    drop_table :lists
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
