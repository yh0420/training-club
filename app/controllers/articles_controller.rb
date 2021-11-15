class ArticlesController < ApplicationController

  
    def index
      
    end
  
    def new
      @article = Article.new
    end
  
    def create
        @article = Article.create!(article_params)
        if @article.save
          redirect_to article_path(@article)
        else
          render :new
        end
    end
    
      private
      def article_params
        params.require(:article).permit(:body)
      end
end