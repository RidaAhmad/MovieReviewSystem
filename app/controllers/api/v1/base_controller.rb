class Api::V1::BaseController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found
    render json: { status: 404, errors: 'Record Not found' }
  end
end
