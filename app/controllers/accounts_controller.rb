class AccountsController < ApplicationController
  def show
    @user = User.find(params[:id])
    @articles = current_user.article.page(params[:page]).per(10)
    if @user == current_user
      redirect_to user_path
    end
    @articles = Article.all.page(params[:page]).per(10)
  end
end