class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :authenticate_user!, only: [:show]
  before_action :authenticate_current_user, only: [:show]

  def show
  end

  private
    def set_user
      @user = User.find(params[:id])
      @user_favorites = @user.favorites.includes(:attachments).page(params[:page])
    end

    def authenticate_current_user
      redirect_to current_user, alert: 'Access Denied!' unless current_user == @user
    end
end
