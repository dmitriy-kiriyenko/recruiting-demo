class AssignmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @assignments = scope.all
  end

  def start
    assignment = scope.find(params[:assignment_id])
    assignment.start!

    redirect_to edit_assignment_path(assignment)
  end

  def edit
    @assignment = scope.find(params[:id])

    if @assignment.start_at
      # ...
    else
      flash[:alert] = 'There are no such assignment'
      redirect_to assignments_path
    end
  end

  def update
    @assignment = scope.find(params[:id])

    if @assignment.is_finished?
      redirect_to assignments_path, notice: 'assignment already finished'
    else
      @assignment.update_attributes(recipient_answers_params)
      redirect_to assignments_path, notice: 'Answers are accepted'
    end
  end

  private

  def scope
    current_user.assignments
  end

  def recipient_answers_params
    params.require(:recipient_reply).permit(recipient_answers_attributes: [:id, :question_id, :answer_id] )
  end
end
