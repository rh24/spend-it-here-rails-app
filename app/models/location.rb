class Location < ApplicationRecord
  has_many :businesses
  has_many :reviews, through: :businesses
  has_many :spendables
  has_many :cryptos, through: :spendables
  
  # has_many :reviews, through: :crypto_business
end
