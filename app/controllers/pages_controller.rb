class PagesController < ApplicationController
  def home
    movies = Movie.includes(:attachments)
    @featured_movies = movies.featured.first(Movie::PER_TYPE)
    @latest_movies = movies.latest.first(Movie::PER_TYPE)
    @top_movies = movies.top.first(Movie::PER_TYPE)
  end
end
