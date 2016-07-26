class RemoveIndicesFromRatings < ActiveRecord::Migration
  def up
    remove_index :ratings, :movie_id if index_exists?(:ratings, :movie_id)
    remove_index :ratings, :user_id if index_exists?(:ratings, :user_id)
  end

  def down
    add_index :ratings, :movie_id unless index_exists?(:ratings, :movie_id)
    add_index :ratings, :user_id unless index_exists?(:ratings, :user_id)
  end
end
