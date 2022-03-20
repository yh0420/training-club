class LikesController < ApplicationController
    before_action :authenticate_user!
   
    def index
        @articles = current_user.favorite_articles
      end

      def create
        current_user.likes.create!(article_id: params[:article_id])
        if current_user.likes.create!(article_id: params[:article_id])
          respond_to do |format|
            format.any
            format.html
            #format.html { redirect_to controller: :accounts, action: :show, id: @user.id }
            format.js
          end
        end
        @article = Article.find(params[:article_id])
        #respond_to do |format|
         # unless following.save
          #  flash.now[:alert] = 'ユーザーのフォローに失敗しました'
          #end
          #format.html { redirect_to controller: :accounts, action: :show, id: @user.id }
          #format.js
        #end
      end

  def destroy
    current_user.likes.find_by(article_id: params[:article_id]).destroy!
    @article = Article.find(params[:article_id])
  end



 
end