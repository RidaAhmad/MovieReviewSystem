class RatingsController < ApplicationController
  before_action :set_rating, only: [ :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :edit, :destroy]
  before_filter :set_movie

  def edit
  end

  def create
    @rating = @movie.ratings.new(rating_params)
    @rating.user_id = current_user.id

    respond_to do |format|
      if @rating.save
        format.html { redirect_to @rating, notice: 'Rating was successfully created.' }
        format.json { render json: { rating: @rating, average: @movie.get_average_rating, rated: @rating.id } }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @rating.update(rating_params)
        format.html { redirect_to @rating, notice: 'Rating was successfully updated.' }
        format.json { render json: { rating: @rating, average: @movie.get_average_rating } }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @rating.destroy
    respond_to do |format|
      format.html { redirect_to ratings_url, notice: 'Rating was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = Rating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rating_params
      params.require(:rating).permit(:score)
    end

    def set_movie
      @movie = Movie.find(params[:movie_id])
    end
end
