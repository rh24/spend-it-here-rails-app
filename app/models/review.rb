class Review < ApplicationRecord
  belongs_to :user
  belongs_to :business
  belongs_to :rating
  belongs_to :crypto

  alias_attribute :crypto_id, :spent_in
end
