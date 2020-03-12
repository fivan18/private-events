class InvitationsController < ApplicationController
  before_action :require_user, only: %i[create new]
  def new
    @invitation = Invitation.new
  end

  def create
    @event = Event.find(params[:event_id])
    @invitee = User.find_by(emai: params[:user_email])
    # @invitation = current_user.sent_invitations.build(params_invitation)
    @invitation = Intivation.new
    @Intivation.sender_id = current_user
    @invitation.event_id = @event
    @invivation.user_id = @invitee

    if @invitation.save
      redirect_to @invitation.event
    else
      flash[:danger] = 'failed to send invitation'
      render new
    end
  end
end
