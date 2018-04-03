class Spendable < ApplicationRecord
  belongs_to :crypto
  belongs_to :business
  belongs_to :location

  # Scope methods

  # spend_by_crypto_id
  def ethereum
    # Spendable.where(crypto_id: Crypto.find_by(name: "Ethereum").joins(:businesses)
  end
end
