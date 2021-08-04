class ApplicationController < ActionController::Base
    #devise by deafault redirects to homepage after login. if we need to redirect anywhere else we need to set that up in the after_sign_in method (create a custom redirect hook)
    def after_sign_in_path_for(profile)
        if(current_user.profile)
            new_listing_path
        else
            new_profile_path || root_path
        end
    end
end
