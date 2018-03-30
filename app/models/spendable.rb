class Spendable < ApplicationRecord
  belongs_to :crypto
  belongs_to :business
end
