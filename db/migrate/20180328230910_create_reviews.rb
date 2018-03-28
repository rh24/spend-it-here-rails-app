class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :comment
      t.boolean :would_recommend
      t.integer :user_id
      t.integer :business_id
      t.integer :rating_id
    end
  end
end
