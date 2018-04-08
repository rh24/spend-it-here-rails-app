class SpendablesController < ApplicationController

  def bitcoin
    @businesses # = scope method for bitcoin
    # Spendable.bitcoin
    render :'businesses/index'
  end
end
