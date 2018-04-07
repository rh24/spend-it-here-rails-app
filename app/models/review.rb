class Review < ApplicationRecord
  belongs_to :user
  belongs_to :business
  belongs_to :crypto

  delegate :location, to: :business

  validates :title, presence: true
  validates :comment, presence: true

  def businesses_attributes=(business_attributes) # How can I clean this custom setter up?
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
    if !self.business_id
      self.business = Business.find_or_create_by(name: business_attributes[:name], location_id: business_attributes[:location_id])
      business.location_attributes = business_attributes[:location_attributes]
      business.category = Category.find_by(id: business_attributes[:category_id])
      business.price_range = business_attributes[:price_range]
      business.description = business_attributes[:description]
      business.discount_offered = business_attributes[:discount_offered]
      business.crypto_attributes=(business_attributes[:cryto_ids])
    else
      business = Business.find_by(id: business_id)
    end
          # binding.pry
    save
    # self.business.update(business)
  end
end
