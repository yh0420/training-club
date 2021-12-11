class UsersController < ApplicationController
    before_action :set_user, only: [:followings, :followers]
    def show
        @user = User.find(params[:id])
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
end
