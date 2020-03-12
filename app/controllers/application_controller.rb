class ApplicationController < ActionController::Base
  include SessionsHelper

  private
    def require_user
      unless logged_in?
        redirect_to signin_path
      end
    end
end
