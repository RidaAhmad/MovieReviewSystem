class FavoriteMovie < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user

  def self.get_favorited(logged_in_user, movie)
    self.where(user_id: logged_in_user, movie_id: movie).last
  end
end
