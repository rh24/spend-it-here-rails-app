class SpendablesController < ApplicationController

  def bitcoin
    @businesses # = scope method for bitcoin
    render :'businesses/index'
  end
end
