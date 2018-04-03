class Review < ApplicationRecord
  belongs_to :user
  belongs_to :business
  belongs_to :crypto
  # alias_attribute :crypto_id, :spent_in

  def businesses_attributes=(business_attributes)
    # Why do I need to put self only once?
    # business_attributes = {"category_id"=>"12", "name"=>"Beacon's Closet", "price_range"=>"$$", "description"=>"One stop shop.", "location_id"=>"1", "discount_offered"=>"1"}
    self.business = Business.find_or_create_by(name: business_attributes[:name], location_id: business_attributes[:location_id])
    business.category = Category.find(business_attributes[:category_id])
    business.price_range = business_attributes[:price_rage]
    business.description = business_attributes[:description]
    business.discount_offered = business_attributes[:discount_offered]

    business_attributes[:crypto_ids].each do |id|
      crypto = Crypto.find(id)
      business.cryptos << crypto if !business.cryptos.include?(crypto)
    end
    
    save
    # self.business.update(business)
  end

  # def crypto_attributes=(crypto)
  #   self.crypto = Crypto.find_or_create_by(name: crypto.name)
  #   self.crypto.update(crypto)
  # end
end
