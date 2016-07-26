class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :select_all_actors, only: [:new, :edit]
  before_action :approval_confirmed, only: [:show, :edit, :update]
  before_action :sanitize_trailer, only: [:create, :update]

  def index
    @movies = params[:commit].present? ? Movie.retrieve_search_results(params) : Movie.retrieve_movies(params[:filter]).page(params[:page])
    @all_actors = Actor.actor_names
  end

  def show
    @review = @movie.reviews.new

    @reviews = @movie.reviews.page(params[:page])

    if user_signed_in?
      @favorite_movie = FavoriteMovie.get_favorited(current_user, @movie)
      @rating = @movie.ratings.get_ratings(current_user.id)
      @rating ||= @movie.ratings.new
    end
  end

  def new
    @movie = Movie.new
  end

  def edit
    @selected_movie_actors = @movie.actors.pluck(:id)
    @selected_genre = @movie.genre
  end

  def create
    @movie = Movie.new(movie_params)
    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @search_results = Movie.search_movies(params)
    respond_to do |format|
      format.js
    end
  end

  private
    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :description, :trailer, :genre, :release_date, :duration, attachments_attributes: [:id, :image, :_destroy], actor_ids: [])
    end

    def select_all_actors
      @all_movie_actors = Actor.pluck(:name, :id)
    end

    def approval_confirmed
      redirect_to root_path unless @movie.approved?
    end

    def sanitize_trailer
      @movie_params = params[:movie]
      @movie_params[:trailer] = ActionController::Base.helpers.sanitize(@movie_params[:trailer], tags: %w(iframe))
      params[:movie] = @movie_params
    end
end
