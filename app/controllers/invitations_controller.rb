class InvitationsController < ApplicationController
  before_action :require_user, only: %i[create new]
  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(params_invitation)
    @invitation.sender_id = current_user.id
    if @invitation.save
      flash[:notice] = 'Invitation sent!'
      redirect_to @invitation.event
    else
      flash[:danger] = 'failed to send invitation'
      render 'new'
    end
  end

  private

  def params_invitation
    params.require(:invitation).permit(:event_id, :user_id)
  end
end
