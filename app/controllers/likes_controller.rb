class LikesController < ApplicationController
    before_action :authenticate_user!
   
    def index
      @articles = current_user.favorite_articles
    end

    def create
      if current_user.likes.create!(article_id: params[:article_id])
        @article = Article.find(params[:article_id])
        @articles = Article.includes(:user, :likes, :comments).order(created_at: :desc)
        @comments = @article.comments.includes(:user).order(created_at: :desc)
        @comment = Comment.new
        respond_to do |format|
          format.js render template "articles/show" 
          #format.html { redirect_to controller: :articles, action: :show, id: params[:article_id] }
          format.any
        end
      end
      #@article = Article.find(params[:article_id])
      #respond_to do |format|
      # unless following.save
        #  flash.now[:alert] = 'ユーザーのフォローに失敗しました'
        #end
        #format.html { redirect_to controller: :accounts, action: :show, id: @user.id }
        #format.js
      #end
    end

  def destroy
    if current_user.likes.find_by(article_id: params[:article_id]).destroy!
      respond_to do |format|
        format.any
        format.html { redirect_to controller: :articles, action: :show, id: params[:article_id] }
        format.js
      end
    end
  end



 
end