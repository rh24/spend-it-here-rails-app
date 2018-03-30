class Crypto < ApplicationRecord
  has_many :spendables
  has_many :businesses, through: :spendables
end
