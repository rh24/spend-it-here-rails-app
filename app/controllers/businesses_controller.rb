class BusinessesController < ApplicationController
  before_action :require_login, except: [:show, :index]
  def new
    @business = Business.new
  end

  def create
    business = Business.new(business_params)
  end

  private

  def business_params
    params.require(:business).permit(:name, :price_range, :description)
  end
end
