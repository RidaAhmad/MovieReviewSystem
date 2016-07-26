class AddIndexToRatings < ActiveRecord::Migration
  def change
    add_index :ratings, [:movie_id, :user_id], unique: true
  end
end
