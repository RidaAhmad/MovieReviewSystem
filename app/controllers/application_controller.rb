class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

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
end
