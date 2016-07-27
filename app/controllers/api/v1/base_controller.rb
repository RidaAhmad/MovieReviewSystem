class Api::V1::BaseController < ApplicationController
  before_action :authenticate_token

  TOKEN = '6651D65E36AA903D68815E924A7EAB6013F03FC9F1D3DC08C0D6A34C16A38434'

  def authenticate_token
    head :unauthorized unless request.headers['Authorization'] == TOKEN
  end
end
