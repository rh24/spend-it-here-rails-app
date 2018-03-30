class Crypto < ApplicationRecord
  has_many :spendables
  has_many :businesses, through: :spendables
  has_many :reviews, as: :crypto_business
end
