class Review < ApplicationRecord
  belongs_to :user
  belongs_to :business
  belongs_to :crypto
  # alias_attribute :crypto_id, :spent_in

  def business_attributes=(business)
    self.business = Business.find_or_create_by(name: business.name)
    self.business.update(business)
  end

  def crypto_attributes=(crypto)
    self.crypto = Crypto.find_or_create_by(name: crypto.name)
    self.crypto.update(crypto)
  end

  # OR
  # should I use a polymorphic association here?
  # belongs_to :crypto_business, polymorphic: true
    # Crypto has_many :reviews, as: :crypto_business
    # Business has_many :reviews, as: :crypto_business
    # Location has_many :reviews, as: :crypto_business
end
