class Review < ApplicationRecord
  belongs_to :user
  belongs_to :business
  belongs_to :crypto
  # alias_attribute :crypto_id, :spent_in

  def businesses_attributes=(business_attributes)
    # Why do I need to put self only once?
    # business_attributes = {"category_id"=>"12", "name"=>"Beacon's Closet", "price_range"=>"$$", "description"=>"One stop shop.", "location_id"=>"1", "discount_offered"=>"1"}
    # "businesses_attributes"=>
    #    {"category_id"=>"7",
    #     "name"=>"Amnesty International",
    #     "price_range"=>"$",
    #     "description"=>"Do good.",
    #     "location_id"=>"1",
    #     "discount_offered"=>"0",
    #     "crypto_ids"=>["", "7", "8", "9", "10", "11", "13", "17", "18", "21"]},
    # Why are blank crypto_ids being generated?

    self.business = Business.find_or_create_by(name: business_attributes[:name], location_id: business_attributes[:location_id])
    business.category = Category.find(business_attributes[:category_id])
    business.price_range = business_attributes[:price_rage]
    business.description = business_attributes[:description]
    business.discount_offered = business_attributes[:discount_offered]
    business.crypto_attributes=(business_attributes[:crypto_ids])
    save
    # self.business.update(business)
  end
end
