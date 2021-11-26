class Users::RegistrationsController < Devise::RegistrationsController 
 
    protected
  # 追記する
  def update_resource(resource, params)
    resource.update_without_password(params)
  end
    
end