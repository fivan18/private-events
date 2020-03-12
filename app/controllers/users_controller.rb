class UsersController < ApplicationController
  before_action :require_user, only: %i[event_going]
  def new
    if logged_in?
      flash.now[:danger] = 'You already logged !'
      redirect_to current_user
    else
      @user = User.new
    end
  end

  def show
    @user = User.find(params[:id])
    @upc_events = @user.events.upcom
    @past_events = @user.attended_events.past
  end

  def event_going
    @event = Event.find(params[:id])
    if current_user.attended_events.include?(@event)
      flash.now[:danger] = 'You already going to this event'
      redirect_to event_path(@event)
    else
      current_user.attended_events << @event
      flash.now[:sucsees] = 'You going to this event'
      redirect_to event_path(@event)
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login_user(@user)
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
