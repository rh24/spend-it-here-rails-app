module ReviewsHelper

  def display_rating(review)
    "#{review.rating} stars."
  end

  def display_email(review)
    review.user.email
  end
end
