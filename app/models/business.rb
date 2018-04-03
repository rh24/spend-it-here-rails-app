class Business < ApplicationRecord
  belongs_to :location
  belongs_to :category
  has_many :spendables
  has_many :cryptos, through: :spendables # Is a three join table a weird thing to do?
  has_many :items
  has_many :reviews
  has_many :users, through: :reviews

  validates :name, presence: true
  validates :description, presence: true

  def crypto_attributes=(crypto_attributes)
    # raise crypto_attributes.inspect # {"ids"=>["", "7", "8"]}
    crypto_attributes[:ids].reject { |value| value.to_s.empty? }.each do |id|
      spendable = Spendable.find_or_create_by(location_id: self.location.id, crypto_id: id)
      self.spendables << spendable if !self.spendables.include?(spendable)
    end
    self.save
    # If I save here will validation errors show up?
    # Before this custom attribute writer hits, the model validations will be triggered first.
  end

  # scope
  # def ratings
  #   self.reviews.where(:rating)
  # end

  # scope method
  # users pay most with ___ crypto
  # select reviews, group by cryptos, order desc, LIMIT 1
end
