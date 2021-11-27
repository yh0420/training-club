class Users::SessionsController < Devise::SessionsController
  def new_guest
    user = User.guest
    sign_in user   # ユーザーをログインさせる
    redirect_to articles_path(id: current_user.id), notice: 'ゲストとしてログインしました'
   
    
    
  end
end