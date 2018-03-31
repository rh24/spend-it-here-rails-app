class BusinessesController < ApplicationController
  before_action :require_login, except: [:show, :index]

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)
    if @business.save
      redirect_to biz_path(@business)
    else
      raise @business.errors.full_messages.inspect
      flash[:alert] = "Fix me!"
      redirect_to new_biz_path
    end
  end

  def index
    @businesses = Business.all
  end

  def show
    @business = Business.find_by(id: params[:id])
  end

  private

  def business_params
    params.require(:business).permit(:name, :price_range, :description, :category_id, :location_id, :crypto_id)
  end
end
