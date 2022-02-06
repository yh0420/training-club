class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    @articles = Article.includes(:user, :likes, :comments).order(created_at: :desc)
    @articles = Article.all.page(params[:page]).per(10)
    @training = Training.includes(:name)
  end

  def show
    p "★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★"
    @article = Article.find(params[:id])
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
        flash.now[:error] = '保存に失敗しました'
        render :new
      end
  end

  def edit
    @article = current_user.article.find(params[:id])
  end

  def update
    @article = current_user.article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article), notice: ' 更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end
  
  def destroy
    article = current_user.article.find(params[:id])
    article.destroy!
    redirect_to root_path, notice: '削除に成功しました'
  end

  private
    def article_params
      params.require(:article).permit(:day, :minutes, :body, :training, :user_id, :comments, :name, :eyecatch)
    end

    def set_article
      @article = Article.find(params[:id])
    end

    def set_training
      @training = Article.find(params[:name])
    end
end