class ReviewsController < ApplicationController
  before_action :require_login, except: [:show, :index]
  before_action :set_business, except: [:create]
  before_action :set_review, only: [:edit, :show, :destroy]

  def new
    @review = Review.new
  end

  def create
    # Why must an instance variable be used here?
    @review = Review.new(review_params)
    # raise params.inspect
    @business = Business.find_by(id: params[:review][:business_id])
    # raise @business.inspect
    if @review.save
      flash[:notice] = "Thank you for submitting a review!"
      # binding.pry
      redirect_to biz_review_path(@business, @review)
    else
      flash[:alert] = "Invalid data. Please, fix."
      render 'new'
    end
  end

  def edit
    # @review = Review.find_by(id: params[:id])
  end

  def update
    # Why do I need to set @review manually here? My before_action doesn't work
    # It will create a new review instead.
    @review = Review.find_by(id: params[:id])

    if @review.update(review_params)
      # @review.update(crypto_ids: business_params[:crypto_attributes][:ids])
      flash[:alert] = "Review was successfully updated."
      redirect_to biz_review_path(@business, @review)
    else
      flash[:alert] = "Fix me!"
      # redirect_to edit_biz_path(@business)
      render :edit
    end
  end

  def show
    # @review = @business.reviews.each { |r| r.id == params[:id] }.first
    # @review = Review.find_by(id: params[:id], business_id: @business.id)
  end

  def index
  end

  def destroy
    @review.destroy
    flash[:alert] = "Review was successfully destroyed."
    redirect_to biz_reviews_path
  end

  private

  def set_business
    @business = Business.find_by(id: params[:biz_id])
  end

  def set_review
    @review = Review.find_by(id: params[:id])
  end

  def review_params
    params.require(:review).permit(
      :title,
      :comment,
      :rating,
      :would_recommend,
      :crypto_id,
      :user_id,
      :business_id,
      :businesses_attributes => {}
    )
  end
  # What's the difference between review_params and review_params(*args)? Why use one over the other?
end
