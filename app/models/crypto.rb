class Crypto < ApplicationRecord
  has_many :spendables
  has_many :businesses, through: :spendables
  has_many :reviews
  # Will the above association even be useful to me?
  # Do I have to draw out every association possible just because I can?
  # What's the best practice on this?
end
