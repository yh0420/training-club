class LikesController < ApplicationController
    before_action :authenticate_user!
   
    def index
        @articles = current_user.favorite_articles
      end

      def create
        current_user.likes.create!(article_id: params[:article_id])
        @article = Article.find(params[:article_id])
      end

  def destroy
    current_user.likes.find_by(article_id: params[:article_id]).destroy!
    @article = Article.find(params[:article_id])
  end



 
end