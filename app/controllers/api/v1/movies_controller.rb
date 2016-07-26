class Api::V1::MoviesController < Api::V1::BaseController
  respond_to :json

  def index
    @movies = Movie.retrieve_search_results(params)

    respond_with @movies
  end

  def show
    @movie = Movie.find(params[:id])

    respond_with @movie.detailed_hash
  end
end
