class PagesController < ApplicationController
  def home
    @featured_movies = Movie.featured.first(4)
    @latest_movies = Movie.latest.first(4)
    @top_movies = Movie.top.first(4)
  end
end
