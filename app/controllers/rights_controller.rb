class RightsController < ApplicationController
  helper_method :folder

  def new
    @invitation = InvitationForm.new
  end

  def create
    @invitation = InvitationForm.new invitation_params.merge folder: folder
    if @invitation.invite
      redirect_to folder, notice: 'Invitations sent'
    else
      render 'new'
    end
  end

  private

  def folder
    @_folder ||= current_user.folders.find params[:folder_id]
  end

  def invitation_params
    params.require(:invitation_form).permit(:emails)
  end
end
