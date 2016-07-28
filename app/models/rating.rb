class Rating < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user

  validates :movie_id, uniqueness: { scope: :user_id }
  validates :score, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

  scope :get_last_rating, -> (logged_in_user) { where(user_id: logged_in_user).last }
end
