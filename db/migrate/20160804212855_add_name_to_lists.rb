class AddNameToLists < ActiveRecord::Migration
  def change
    add_column :lists, :name, :string
    add_column :lists, :uid, :string
    add_column :lists, :description, :string
    add_column :lists, :image_url, :string
    add_column :lists, :url, :string
  end
end
