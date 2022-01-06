class Users::RegistrationsController < Devise::RegistrationsController 
 
    protected
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def sign_up_params
    
    params.permit(:name, :email, :password, :password_confirmation)
  end
end