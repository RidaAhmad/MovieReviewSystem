class CreateFavoriteMovies < ActiveRecord::Migration
  def change
    create_table :favorite_movies do |t|
      t.belongs_to :user, index: true, null: false
      t.belongs_to :movie, index: true, null: false

      t.timestamps null: false
    end
  end
end
