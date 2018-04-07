class Business < ApplicationRecord
  belongs_to :location
  belongs_to :category
  has_many :spendables
  has_many :cryptos, through: :spendables # Is a three join table a weird thing to do?
  has_many :items
  has_many :reviews
  has_many :users, through: :reviews

  validates :name, presence: true
  validates :description, presence: true

  def location_attributes=(location_attributes)
    if !!self.location_id
      location = Location.find_by(id: location_id)
    else
      # location_attributes = {"city"=>"Austin", "state"=>"Texas", "country"=>"USA"}
      self.location = Location.find_or_create_by(location_attributes) if !location_attributes.values.include?("")
    end
    save
  end

  def crypto_attributes=(cyrypto_ids)
    crypto_ids.reject { |value| value.to_s.empty? }.each do |id|
      spendable = Spendable.find_or_create_by(location_id: self.location.id, crypto_id: id)
      self.spendables << spendable if !self.spendables.include?(spendable)
    end
    self.save
    # If I save here will validation errors show up?
    # Before this custom attribute writer hits, the model validations will be triggered first.
  end

  # scope
  # def ratings
  #   self.reviews.where(:rating)
  # end

  # scope method
  # users pay most with ___ crypto
  # select reviews, group by cryptos, order desc, LIMIT 1

  scope :offer_discounts, -> (offer_discounts) { where(discount_offered: true) }

    # def self.offer_discounts
    #   where(discount_offered: true)
    # end


  # When should I use a scope method versus a class method? i.e. Is it nonsensical to use .order_by_name as a scope method?

  def self.order_by_name
    order(name: "asc")
  end

  def previous_page
    self.class.where("name < ?", self.name).order(name: "desc").first
  end

  def next_page
    self.class.where("name > ?", self.name).order(name: "asc").first
  end
end
