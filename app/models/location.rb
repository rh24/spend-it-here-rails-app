class Location < ApplicationRecord
  has_many :businesses
  has_many :reviews, through: :businesses
  has_many :spendables
  has_many :cryptos, through: :spendables

  def full_location
    city != "N/A" ? full_location ||= "#{city}, #{state}, #{country}" : city
  end

  def self.order_by_city
    order(city: "asc")
  end

  # In the future,
  # I want to be able to separate within the dropdown menu by country,
  # or show city and state progressively after country is selected.
end
