class ReviewsController < ApplicationController
  before_action :require_login, except: [:show, :index]
  before_action :set_business

  def new
    @review = Review.new
  end

  def create
    # Why must an instance variable be used here?
    # raise review_params.inspect
    @review = Review.new(review_params)
    @business = Business.find_or_create_by(params[:review][:business])
    if @review.save && !!@business.save
      @review.business = @business
      @review.save
          # binding.pry
      redirect_to biz_review_path(@business, @review)
    else
      flash[:alert] = "Invalid data. Please, fix."
      render 'new'
    end
  end

  def show
    @review = Review.find_by(id: params[:id])
  end

  def index
  end

  private

  def set_business
    @business = Business.find_by(id: params[:biz_id])
  end

  def review_params
    params.require(:review).permit(
      :title,
      :comment,
      :would_recommend,
      :crypto_id,
      :user_id,
      :business_id,
      :businesses_attributes => {}
        # :category_id,
        # :name,
        # :price_range,
        # :description,
        # :location_id,
        # :discount_offered
    )
  end
  # What's the difference between review_params and review_params(*args)? Why use one over the other?
end
