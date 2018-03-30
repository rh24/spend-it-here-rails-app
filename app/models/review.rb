class Review < ApplicationRecord
  belongs_to :user
  belongs_to :rating
  belongs_to :business
  belongs_to :crypto
  # alias_attribute :crypto_id, :spent_in

  # OR
  # should I use a polymorphic association here?
  # belongs_to :crypto_business, polymorphic: true
    # Crypto has_many :reviews, as: :crypto_business
    # Business has_many :reviews, as: :crypto_business
    # Location has_many :reviews, as: :crypto_business
end
