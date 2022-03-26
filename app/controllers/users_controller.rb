class UsersController < ApplicationController
    before_action :set_user, only: [:followings, :followers]
  def show
    p Rails.application.routes.recognize_path(request.referer)
    if params[:id] != "guest_sign_in"
      @user = User.find(params[:id])
    else
      @user = User.find(1)
    end
    if @current_user.present?
      @articles = @current_user.article.page(params[:page]).per(10)
    else 
      @articles = current_user.article.page(params[:page]).per(10)
    end
  end

  def followings
    @users = @user.followings
  end

  def followers
    @users = @user.followers
  end

  def followings_count
    followings.count
  end

  def followers_count
    followers.count
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
