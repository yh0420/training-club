class RelationshipsController < ApplicationController
  skip_forgery_protection
  before_action :set_user
 
  def create
    following = current_user.follow(@user)
    respond_to do |format|
      unless following.save
        flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      end
      format.html { redirect_to controller: :accounts, action: :show, id: @user.id }
      format.js
    end
  end

  def destroy
    following = current_user.unfollow(@user)
    respond_to do |format|
      unless following.destroy
        flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      end
      format.html { redirect_to controller: :accounts, action: :show, id: @user.id }
      format.js
    end
  end

  private
    def set_user
    @user = User.find(params[:relationship][:follow_id])
    @follow_user = current_user
    end
end

