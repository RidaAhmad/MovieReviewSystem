class ChangeColumnNullMovieReleaseDate < ActiveRecord::Migration
  def up
    change_column_null :movies, :release_date, false
  end

  def down
    change_column_null :movies, :release_date, true
  end
end
