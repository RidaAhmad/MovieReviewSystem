class FavoriteMoviesController < ApplicationController
  before_action :set_favorite_movie, only: [:destroy]
  before_action :set_movie, only: [:create, :destroy]

  def create
    @favorite_movie = @movie.favorite_movies.build
    @favorite_movie.user = current_user

    respond_to do |format|
      if @favorite_movie.save
        format.html { redirect_to @movie, notice: 'Successfully marked as favorite!' }
      else
        format.html { redirect_to @movie, alert: 'Could not mark as favorite!' }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @favorite_movie.destroy
        format.html { redirect_to @movie, notice: 'Successfully marked as unfavorite!' }
      else
        format.html { redirect_to @movie, alert: 'Could not mark as unfavorite!' }
      end
    end
  end

  private
    def set_movie
      @movie = Movie.find(params[:movie_id])
    end

    def set_favorite_movie
      @favorite_movie = FavoriteMovie.find(params[:id])
    end

end
