class Business < ApplicationRecord
  belongs_to :location
  belongs_to :category
  has_many :spendables
  has_many :cryptos, through: :spendables
  has_many :items
  has_many :reviews
  has_many :users, through: :reviews

  accepts_nested_attributes_for :cryptos

  # scope
  # def ratings
  #   self.reviews.where(:rating)
  # end
end
