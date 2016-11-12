class RecipientRepliesController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipient_replies = scope.all
  end

  def new
    @recipient_reply = scope.build
  end

  def create
    @recipient_reply = scope.create(recipient_replies_params)

    redirect_to recipient_replies_url, notice: 'Questionnaires assignments was created!'
  end

  def show
    @recipient_reply = find_recipient_reply
  end



  private

  helper_method :available_users
  def available_users
    @available_users ||= User.where.not(id: current_user.id)
  end

  helper_method :available_surveys
  def available_surveys
    @available_surveys ||= current_user.surveys
  end

  def scope
    current_user.recipient_replies
  end

  def find_recipient_reply
    scope.find(params[:id])
  end

  def recipient_replies_params
    params.require(:recipient_reply).permit(:user_id, :survey_id)
  end
end
