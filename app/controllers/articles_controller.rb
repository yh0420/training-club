class ArticlesController < ApplicationController
    def index
      @articles = Article.all
    end
    
    def show
    end

    def new 
        @article = Article.new
    end

    def create
        @article = current_user.articles.build(article_params)
        if @article.save
          redirect_to articles_path, notice: '投稿しました'
        else
          flash.now[:alert] = '投稿に失敗しました'
          render :new
        end
        @total_minutes = current_user.articles.sum(:minutes)
        @user = User.find(current_user.id)
        @user.level = @total_minutes / 30
        @user.update(level: @user.level)
    end
    

    def destroy
    end

    def edit 
    end

end