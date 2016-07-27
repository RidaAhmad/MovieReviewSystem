class ReportsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :set_review
  before_action :verify_already_reported, only: [:create]

  def create
    @report = @review.reports.build(user: current_user)

    respond_to do |format|
      if @report.save
        format.html { redirect_to @movie, notice: 'Report was successfully created.' }
        format.js
      else
        format.html { redirect_to @movie, alert: 'Report was not successfully created.' }
        format.js
      end
    end
  end

  private
    def report_params
      params.require(:report).permit(:review_id)
    end

    def set_review
      @review = Review.find(params[:review_id])
    end

    def verify_already_reported
      redirect_to movies_path, alert: 'Already Reported!' if Report.already_reported?(@review.id, current_user.id)
    end
end
