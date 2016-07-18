module ReportsHelper
  def reported_already?(review_user, logged_in_user)
    Report.already_reported?(review_user, logged_in_user)
  end
end
