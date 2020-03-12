class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def require_user
    redirect_to signin_url unless logged_in?
  end
end
