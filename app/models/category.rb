class Category < ApplicationRecord
  has_many :businesses

  # I want to create a module for self.order_by_name class methods because it's used in Category and Business models
  # Make the code DRY.
  
  def self.order_by_name
    order(name: "asc")
  end
end
