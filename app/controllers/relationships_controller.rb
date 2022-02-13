class RelationshipsController < ApplicationController
  protect_from_forgery
  before_action :set_user
  
    

  def create
    p session
    following = @follow_user.follow(@user)
    if following.save
      
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
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

