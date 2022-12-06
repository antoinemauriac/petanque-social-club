class InvitationsController < ApplicationController
  def create
    @invited = User.find(params[:invitation])
    @invitation = Invitation.new(user_id: current_user.id, friend_id: @invited.id)
    @invitation.save
    redirect_to accueil_path
  end

  def destroy
    invitation = Invitation.find(params[:invitation_id])
    invitation.destroy
    redirect_to user_path(current_user.id)
  end

  def update
    invitation = Invitation.find(params[:invitation_id])
    p current_user
    invitation.update(confirmed: true)
    redirect_to user_path(invitation.friend_id)
  end

  def index
      @invitations = Invitation.all
  end

  def community
    @invitation = Invitation.new
    @users = User.all
    if params[:query].present?
      @users = User.global_search(params[:query])
    end
  end
end
