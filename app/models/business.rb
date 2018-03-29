class Business < ApplicationRecord
  has_many :business_categories
  has_many :categories, through: :business_categories
  has_many :items
  has_many :reviews
  has_many :ratings, through: :reviews
  has_many :users, through: :reviews
end
