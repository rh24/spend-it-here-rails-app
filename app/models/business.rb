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

  # accepts_nested_attributes_for :cryptos

  def crypto_attributes=(crypto_attributes)
    # raise crypto_attributes.inspect # {"id_1"=>"3", "id_2"=>"", "id_3"=>""}
    c = crypto_attributes.values.reject { |value| value.to_s.empty? }
        # binding.pry
    c.each do |id|
      crypto = Crypto.find_by(id: id)
      self.cryptos << crypto if !self.cryptos.include?(crypto)
    end
  end

  # scope
  # def ratings
  #   self.reviews.where(:rating)
  # end
end
