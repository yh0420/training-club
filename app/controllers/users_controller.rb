class UsersController < ApplicationController
    before_action :set_user, only: [:followings, :followers]
    #before_action :set_current_user
    helper_method :current_user
    
  def show
    p Rails.application.routes.recognize_path(request.referer)
    p "session"
    p session
    if params[:id] != "guest_sign_in"
      @user = User.find(params[:id])
    else
      @user = User.find(1)
    end
    if current_user.nil?
      @articles = User.find_by(id: session[:user_id]).article.page(params[:page]).per(10)
    end
      @articles = current_user.article.page(params[:page]).per(10)
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

    #def set_current_user
     # p "current_user"
      #@current_user = User.find_by(id: session[:user_id])
    #end
end
