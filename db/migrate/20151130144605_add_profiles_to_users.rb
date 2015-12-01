class AddProfilesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile, :text
    add_column :users, :prefecture, :string
    add_column :users, :gender, :string
    add_column :users, :generation, :string
  end
end
