class Business < ApplicationRecord
  belongs_to :category
  has_many :items
  has_many :reviews
  has_many :ratings, through: :reviews
  has_many :users, through: :reviews
end
