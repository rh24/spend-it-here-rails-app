class ReviewsController < ApplicationController
  before_action :require_login, except: [:show, :index]
  before_action :set_business

  def new
    @review = Review.new
  end

  def create
    # Why must an instance variable be used here?
    @review = Review.new(review_params)
    # @business = Business.find_or_create_by(params[:review][:business])
    if @review.save
      binding.pry
      redirect_to biz_review_path(@review.business.id, @review)
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
    )
  end
  # What's the difference between review_params and review_params(*args)? Why use one over the other?
end
