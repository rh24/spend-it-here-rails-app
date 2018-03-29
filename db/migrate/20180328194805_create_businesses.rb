class CreateBusinesses < ActiveRecord::Migration[5.1]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :price_range
      t.text :description

      t.timestamps null: false
    end
  end
end
