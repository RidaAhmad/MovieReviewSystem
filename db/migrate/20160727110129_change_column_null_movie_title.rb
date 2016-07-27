class ChangeColumnNullMovieTitle < ActiveRecord::Migration
  def up
    change_column_null :movies, :title, false
  end

  def down
    change_column_null :movies, :title, true
  end
end
