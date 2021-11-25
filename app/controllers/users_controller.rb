class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @articles = current_user.article

        
       
    end
    
end