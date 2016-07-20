class Api::V1::MoviesController < Api::V1::BaseController
  respond_to :json

  def show
    @movie = Movie.find(params[:id])

    respond_with @movie.detailed_hash
  end

  def index
    @movies = Movie.search_movies(params)
    @search_result = Movie.all_details_hash(@movies)

    respond_with Kaminari.paginate_array(@search_result)
  end
end
