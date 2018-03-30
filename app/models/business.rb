class Business < ApplicationRecord
  belongs_to :location
  belongs_to :category
  has_many :spendables
  has_many :cryptos, through: :spendables
  has_many :items
  has_many :reviews
  has_many :users, through: :reviews

  def crypto_attributes=(crypto)
    spendable = Spendable.new(location_id: self.location.id, business_id: self.id)
    self.crypto = Crypto.find_or_create_by(name: crypto.name)
    self.crypto.update(crypto)
  end

  # scope
  # def ratings
  #   self.reviews.where(:rating)
  # end
end
