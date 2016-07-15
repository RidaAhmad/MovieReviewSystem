module PagesHelper
  def display_user_email(review_user)
    review_user.email
  end

  def review_owner?(review_user, logged_in_user)
    review_user == logged_in_user if logged_in_user.present?
  end

  def get_email_pattern
    return '[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,63}$'
  end
end
