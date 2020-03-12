class ApplicationController < ActionController::Base
  include SessionsHelper

  private 
  def require_user
    flash[:danger] = 'Action not Allowed . You must logged in!'
    redirect_to signin_url
  end
end
