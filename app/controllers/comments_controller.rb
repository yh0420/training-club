class CommentsController < ApplicationController
        def new
            article = Article.find(params[:article_id])
            @comment = article.comments.build
        end
    
        def create
            article = Article.find(params[:article_id])
            @comment = article.comments.build(comment_params)
            if @comment.save
                redirect_to article_path(article), notice: 'コメントを追加'
            else
                flash.now[:error] = '更新できませんでした'
                
               end
            end
        def destroy
            current_user.comments.find(params[:id]).destroy!
            flash[:alert] = '削除しました'
            redirect_back(fallback_location: root_path)
        end
        
        private
        def comment_params
            params.require(:comment).permit(:content, :user_id, :article_id).merge(user_id: current_user.id, article_id: params[:article_id])
        end
end

    
