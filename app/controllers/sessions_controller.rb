class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user
      login_user(user)
      redirect_to user_path(user)
    else
      render 'new'
    end
  end

  def destroy
    logout
  end
end
