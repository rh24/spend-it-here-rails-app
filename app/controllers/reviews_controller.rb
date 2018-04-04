class ReviewsController < ApplicationController
  before_action :require_login, except: [:show, :index]
  before_action :set_business, except: [:create]

  def new
    @review = Review.new
  end

  def create
    # Why must an instance variable be used here?
    @review = Review.new(review_params)
    # raise params.inspect
    @business = Business.find_by(id: params[:biz_id])
    # raise @business.inspect
    if @review.save
      flash[:notice] = "Thank you for submitting a review!"
      redirect_to biz_review_path(@review.business.id, @review)
    else
      flash[:alert] = "Invalid data. Please, fix."
      render 'new'
    end
  end

  def show
    @review = @business.reviews.each { |r| r.id == params[:id] }.first
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
