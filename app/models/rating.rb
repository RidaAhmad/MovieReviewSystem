class Rating < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user

  validates :movie_id, uniqueness: { scope: :user_id }

  scope :get_last_rating, -> (logged_in_user) { where(user_id: logged_in_user).last }
end
