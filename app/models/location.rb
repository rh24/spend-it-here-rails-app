class Location < ApplicationRecord
  has_many :businesses
  # business has_many :cryptos
  # Is there any way to leverage an association from a has_many -> has_many?
  # Or, is below fine?

  has_many :spendables
  has_many :cryptos, through: :spendables
  # has_many :businesses, through: :spendables
end
