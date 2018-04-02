class Business < ApplicationRecord
  belongs_to :location
  belongs_to :category
  has_many :spendables
  has_many :cryptos, through: :spendables
  has_many :items
  has_many :reviews
  has_many :users, through: :reviews
  # has_many :cryptos, through: :reviews

  validates :name, presence: true
  validates :description, presence: true

  def crypto_attributes=(crypto_attributes)
    # raise crypto_attributes.inspect # {"id_1"=>"3", "id_2"=>"", "id_3"=>""}
    ids = crypto_attributes.values.reject { |value| value.to_s.empty? }
    ids.each do |id|
      spendable = Spendable.new(location_id: self.location.id, crypto_id: id)
      self.spendables << spendable if !self.spendables.include?(spendable)
      # Should I be doing this in the custom attribute writer or the businesses#create controller action?
      # crypto = Crypto.find_by(id: id)
      # self.cryptos << crypto if !self.cryptos.include?(crypto)
    end

    self.save
    # If I save here will validation errors show up?
    # Before this custom attribute writer hits, the model validations will be triggered first.
  end

  # scope
  # def ratings
  #   self.reviews.where(:rating)
  # end
end
