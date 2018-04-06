class Location < ApplicationRecord
  has_many :businesses
  has_many :reviews, through: :businesses
  has_many :spendables
  has_many :cryptos, through: :spendables

  validates :city, presence: true, uniqueness: true, allow_blank: false
  validates :state, presence: true, uniqueness: true, allow_blank: false
  validates :country, presence: true, uniqueness: true, allow_blank: false

  def full_location
    city != "N/A" ? full_location ||= "#{city}, #{state}, #{country}" : city
  end

  def self.order_by_city
    order(city: "asc")
  end

  # In the future,
  # I want to be able to separate within the dropdown menu by country,
  # or show city and state progressively after country is selected.

  # I want to be able to use Google maps or some other gem to validate locations.
  # I don't want users to be able to create non-existent locations.
end
