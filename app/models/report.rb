class Report < ActiveRecord::Base
  belongs_to :review
  belongs_to :user

  def self.already_reported?(review_id, logged_in_user)
    Report.exists?(review_id: review_id, user_id: logged_in_user)
  end
end
