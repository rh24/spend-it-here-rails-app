class BusinessesController < ApplicationController
  before_action :require_login, except: [:show, :index]
  before_action :set_business, only: [:edit, :update, :show, :destroy]

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)
    # raise business_params.inspect
    if @business.save
      # c = business_params[:crypto_attributes].values.reject { |value| value.to_s.empty? }
      # c.each do |id|
      #   Spendable.find_or_create_by(location_id: self.location.id, business_id: self.id, crypto_id: id)
      # end
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
    params.require(:business).permit(
      :name,
      :price_range,
      :description,
      :category_id,
      :location_id,
      crypto_attributes: {}
    )
  end
end
