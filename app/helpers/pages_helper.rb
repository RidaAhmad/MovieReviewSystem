module PagesHelper
  def display_user_email(review_user)
    review_user.email
  end

  def review_owner?(review_user, logged_in_user)
    review_user == logged_in_user if logged_in_user.present?
  end
end
