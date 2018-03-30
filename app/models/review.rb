class Review < ApplicationRecord
  belongs_to :user
  belongs_to :business
  belongs_to :crypto
  # alias_attribute :crypto_id, :spent_in

  accepts_nested_attributes_for :business
  accepts_nested_attributes_for :crypto
  
  # OR
  # should I use a polymorphic association here?
  # belongs_to :crypto_business, polymorphic: true
    # Crypto has_many :reviews, as: :crypto_business
    # Business has_many :reviews, as: :crypto_business
    # Location has_many :reviews, as: :crypto_business
end
