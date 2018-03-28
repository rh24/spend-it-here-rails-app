class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :inventory
      t.integer :price
      t.text :description

      t.timestamps null: false
    end
  end
end
