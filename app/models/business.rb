class Business < ApplicationRecord
  belongs_to :location
  has_many :business_categories
  has_many :categories, through: :business_categories
  has_many :spendables
  has_many :cryptos, through: :spendables
  has_many :items
  has_many :reviews, as: :crypto_business
  has_many :ratings, through: :reviews
  has_many :users, through: :reviews
end
