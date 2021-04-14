class ApplicationController < ActionController::Base

  private

    def after_sign_in_path_for(resource)
      authenticated_user_root_path
    end
end
