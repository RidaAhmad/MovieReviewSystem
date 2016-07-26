class Report < ActiveRecord::Base
  belongs_to :review
  belongs_to :user

  validates :review_id, uniqueness: { scope: :user_id }

  after_create :increment_report_count
  after_destroy :decrement_report_count

  def self.already_reported?(review_id, logged_in_user)
    Report.exists?(review_id: review_id, user_id: logged_in_user)
  end

  private
    def increment_report_count
      self.review.increment!(:report_count)
    end

    def decrement_report_count
      self.review.decrement!(:report_count)
    end
end
