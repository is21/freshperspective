class AddUsernameToLists < ActiveRecord::Migration
  def change
    add_column :lists, :username, :string
  end
end
