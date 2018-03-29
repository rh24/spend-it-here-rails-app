class ReviewsController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update]

  def new
    @business = Business.find_by(id: params[:business_id])
    @review = Review.new
  end

  def create
    review = Review.new(review_params)
    if review.save && params[:business_id]
      redirect_to biz_review_path(params[:business_id], review)
    elsif review.save
      redirect_to review_path(review)
    else
      render 'new', :alert => 'Please fix the following errors:'
    end
  end

  def show
    @review = Review.find_by(id: params[:id])
  end

  private

  def review_params
    params.require(:review).permit(:title, :comment, :would_recommend, :rating_id)
  end
  # What's the difference between review_params and review_params(*args)? Why use one over the other?

  def require_login
    redirect_to new_user_session_path if !current_user
  end
end
