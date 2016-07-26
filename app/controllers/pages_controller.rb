class PagesController < ApplicationController
  def home
    @featured_movies = Movie.featured.first(Movie::PER_TYPE)
    @latest_movies = Movie.latest.first(Movie::PER_TYPE)
    @top_movies = Movie.top.first(Movie::PER_TYPE)
  end
end
