class CreateBusinesses < ActiveRecord::Migration[5.1]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :price_range
      t.text :description
      t.integer :category_id
      t.integer :rating_id

      t.timestamps null: false
    end
  end
end
