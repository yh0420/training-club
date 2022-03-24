class Users::SessionsController < Devise::SessionsController
  def guest_sign_in
    user = User.find(1)  #ゲストユーザー（id:28）にログインさせている
    user.update(email: 'guest@example.com', name: 'ゲストユーザー') do |u|
      u.password = SecureRandom.urlsafe_base64
    end
    sign_in user #ユーザーにログインさせる
    #redirect_to user_path(id: current_user.id)
    redirect_to root_path
  end
end