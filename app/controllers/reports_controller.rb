class ReportsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :set_review

  def create
    unless Report.already_reported?(@review.id, current_user.id)
      @report = @review.reports.build
      @report.user_id = current_user.id

      respond_to do |format|
        if @report.save
          increment_report_count
          format.html { redirect_to @movie, notice: 'Report was successfully created.' }
          format.js
        else
          format.html { redirect_to @movie, alert: 'Report was not successfully created.' }
          format.js
        end
      end
    end
  end

  private
    def increment_report_count
      @review.report_count += 1
      @review.save
    end

    def report_params
      params.require(:report).permit(:review_id)
    end

    def set_review
      @review = Review.find(params[:review_id])
    end
end
