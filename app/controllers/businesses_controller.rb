class BusinessesController < ApplicationController
  before_action :require_login, except: [:show, :index]
  before_action :set_business, only: [:edit, :update, :show, :destroy]

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)
    # binding.pry
    if @business.save
      redirect_to biz_path(@business)
    else
      raise @business.errors.full_messages.inspect
      flash[:alert] = "Fix me!"
      redirect_to new_biz_path
    end
  end

  def edit
  end

  def index
    @businesses = Business.all
  end

  def show
  end

  def destroy
    @business.destroy
    flash[:alert] = "Business was successfully destroyed."
    redirect_to biz_index_path
  end

  private

  def set_business
    @business = Business.find_by(id: params[:id])
  end

  def business_params
    params.require(:business).permit(:name, :price_range, :description, :category_id, :location_id, crypto_ids: [])
  end
end
