class SessionsController < Devise::SessionsController

# POST /resource/sign_in
#check if there is any value in session[:card_id] then this need to be added in credit_profiles table
#as user click on add_to_profile in card show page and not logged in then he will redirected to sign page
  def create
    resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
#    respond_with resource, :location => after_sign_in_path_for(resource)
     #render :text=>"logged in"
      
     if  !session[:card_id].blank? and current_user.profile.cards.include? Card.find(session[:card_id])
	  flash[:notice] = "Card Is Already Added To Your Profile"
     else	
          CardsProfile.create(:card_id=>params[:id],:profile_id=>current_user.profile.id)
     end
     session[:card_id] = nil
   
     redirect_to profile_path(current_user)
  end
  def auth_options
    { :scope => resource_name, :recall => "#{controller_path}#new" }
  end


end
