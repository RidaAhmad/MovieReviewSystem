class Api::V1::BaseController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found
    render json: { status: 404, errors: 'Record Not found' }
  end

  def paginate(resource)
    resource = resource.page(params[:page] || 1)
    resource = resource.per_page(params[:per_page]) if params[:per_page].present?
    resource
  end
end
