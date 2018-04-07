class AddIndexToUsers < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :uid
    add_index :users, :provider
  end
end
