class SessionsController < Devise::SessionsController

# POST /resource/sign_in
  def create
    resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
#    respond_with resource, :location => after_sign_in_path_for(resource)
     #render :text=>"logged in"
     p "logged in user"
     redirect_to profile_path(current_user)
  end
  def auth_options
    { :scope => resource_name, :recall => "#{controller_path}#new" }
  end
end
