class Location < ApplicationRecord
  has_many :businesses
  has_many :reviews, through: :businesses
  has_many :spendables
  has_many :cryptos, through: :spendables

  def full_location
    if city != "N/A"
      full_location ||= "#{city}, #{state}, #{country}"
    else
      city
    end
  end
end
