class RelationshipsController < ApplicationController
  skip_forgery_protection
  before_action :set_user
  before_action :user_signed_in?
  helper_method :current_user
 
  def create
    p session
    following = current_user.follow(@user)
    respond_to do |format|
      unless following.save
        flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      end
      format.js
    end
  end

  def destroy
    following = current_user.unfollow(@user)
    if following.destroy
      
    else
      flash.now[:alert] = "ユーザーのフォロー解除に失敗しました"
    end
  end

  private
    def set_user
    @user = User.find(params[:relationship][:follow_id])
    @follow_user = current_user
    end
end

