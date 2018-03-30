class CreateSpendables < ActiveRecord::Migration[5.1]
  def change
    create_table :spendables do |t|
      t.integer :crypto_id
      t.integer :business_id

      t.timestamps null: false
    end
  end
end
