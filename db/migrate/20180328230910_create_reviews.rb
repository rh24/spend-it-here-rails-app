class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :comment
      t.boolean :would_recommend, default: false
      t.integer :user_id
      t.integer :business_id      # Before, I had these two foreign
      t.integer :crypto_id        # keys in place of the polymorphic association.
      # t.integer :crypto_business_id
      # t.string  :crypto_business_type

      t.timestamps null: false
    end

    # add_index :reviews, [:crypto_business_type, :crypto_business_id]
  end
end
