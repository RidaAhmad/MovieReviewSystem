class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :edit, :destroy]
  before_action :set_movie
  before_action :authenticate_owner, only: [:destroy, :edit, :update]


  def edit
  end

  def create
    @review = @movie.reviews.new(review_params)
    @review.user = current_user

    respond_to do |format|
      if @review.save
        format.html { redirect_to @movie, notice: 'Review was successfully created.' }
        format.js
      else
        format.html { redirect_to @movie, alert: 'Review was not successfully created.' }
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @movie, notice: 'Review was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @review.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:comment)
    end

    def set_movie
      @movie = Movie.find(params[:movie_id])
    end

    def authenticate_owner
      redirect_to movies_path, alert: 'Access Denied!' unless current_user == @review.user
    end
end
