class ReviewsController < ApplicationController
  before_action :require_login, except: [:show, :index]
  before_action :set_business

  def new
    @review = Review.new
  end

  def create
    review = Review.new(review_params)
    if review.save && !!@business
      redirect_to biz_review_path(@business, review)
    elsif review.save
      redirect_to review_path(review)
    else
      render 'new', :alert => "Invalid data. Please, fix"
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
    params.require(:review).permit(:title, :comment, :would_recommend)
  end
  # What's the difference between review_params and review_params(*args)? Why use one over the other?
end
