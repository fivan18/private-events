class SessionsController < ApplicationController
  def new
    if logged_in?
      flash.now[:danger] = 'You already logged !'
      redirect_to current_user
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      login_user(user)
      redirect_to user_path(user)
    else
      render 'new'
    end
  end

  def event_going
    @event = Event.find(params[:id])
    current_user.attended_events << @event
    redirect_to event_path(@event)
  end

  def destroy
    logout
  end
end
