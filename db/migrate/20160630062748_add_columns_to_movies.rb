class AddColumnsToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :genre, :string, limit: 30, null: false
    add_column :movies, :release_date, :datetime
    add_column :movies, :duration, :integer
  end
end
