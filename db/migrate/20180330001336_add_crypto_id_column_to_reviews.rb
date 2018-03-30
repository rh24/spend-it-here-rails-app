class AddCryptoIdColumnToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :crypto_id, :integer
  end
end
