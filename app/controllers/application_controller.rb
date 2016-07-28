class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ThinkingSphinx::ConnectionError, with: :sphinx_search_unavailable

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [attachment_attributes: [:id, :image, :_destroy]])
  end

  def not_found
    respond_to do |format|
      format.html { redirect_to root_path, alert: 'Record Not Found!' }
      format.json { render json: { status: 404, errors: 'Record Not Found!' } }
    end
  end

  def sphinx_search_unavailable
    respond_to do |format|
      format.html { redirect_to root_path, alert: 'Search Unavailable Currently!' }
      format.json { render json: { errors: 'Search Unavailable Currently!' } }
    end
  end
end
