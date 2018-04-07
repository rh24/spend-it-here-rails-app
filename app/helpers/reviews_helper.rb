module ReviewsHelper

  def display_rating(review)
    "#{review.rating} stars."
  end

  def display_email(review)
    review.user.email
  end

  def display_edit_link(review)
    link_to "Edit Review", edit_biz_review_path(@business, @review) if is_creator_of(review)
  end

  def display_delete_link(review)
    link_to "Delete", biz_review_path(@business, @review), :method => :delete, :confirm => "Are you sure?" if is_creator_of(review)
  end

  def display_all_link(review)
    link_to "See all #{@business.name}'s reviews", biz_reviews_path(@business)
  end

  def display_recommendation(review)
    if review.would_recommend
      "#{display_email(review)} recommends this business. #{display_rating(review)}"
    else
      "#{display_email(review)} does not recommend this business."
    end
  end

  private

  def is_creator_of(review)
    review.user == current_user
  end
end
