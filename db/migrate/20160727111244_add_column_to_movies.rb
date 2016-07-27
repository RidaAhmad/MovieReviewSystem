class AddColumnToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :delta, :boolean, default: true, null: false, index: true
  end
end
