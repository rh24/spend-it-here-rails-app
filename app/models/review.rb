class Review < ApplicationRecord
  belongs_to :user
  belongs_to :rating
  # belongs_to :business
  # belongs_to :crypto
  # alias_attribute :crypto_id, :spent_in

  # OR
  # should I use a polymorphic association here?
  belongs_to :crypto_business, polymorphic: true
    # Crypto has_many :reviews, as: :crypto_business
    # Business has_many :reviews, as: :crypto_business


    # class CreateReviews < ActiveRecord::Migration[5.0]
    #   def change
    #     create_table :reviews do |t|
    #       t.integer :crypto_business_id
    #       t.string  :crypto_business_type
    #       t.timestamps
    #     end
    #
    #     add_index :reviews, [:crypto_business_type, :crypto_business_id]
    #   end
    # end
end
