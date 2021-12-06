class ArticlesController < ApplicationController
    before_action :set_article, only: [:show,]
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  
    def index
      @articles = Article.includes(:user, :likes, :comments).order(created_at: :desc)
      @articles = Article.all
      @training = Training.includes(:name)
    
      
      
    end
    def show
        @article = Article.find(params[:id])
        @articles = Article.all
        @articles = Article.includes(:user, :likes, :comments).order(created_at: :desc)
        @comments = @article.comments.includes(:user).order(created_at: :desc)
        @comment = Comment.new
        
    end
  
    def new
      @article = Article.new      
    end
  
    def create
        @article = current_user.article.build(article_params)
        if @article.save
          redirect_to article_path(@article), notice: '保存できました'
        else
          render :new
        end
    end

      private
      def article_params
        params.require(:article).permit(:day, :minutes, :body, :training, :user_id, :comments, :name)
      end

      def set_article
        @article = Article.find(params[:id])
      end
      def set_training
        @training = Article.find(params[:name])
      end
end