class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :html


  def index
    @questions = scope.all
  end


  def show
  end


  def new
    @question = Question.new
    @question.answers.build
  end


  def edit
    @question.answers.build
  end


  def create
    @question = Question.new(questionnaire_params)
    @question.owner_id = current_user.id
    if @question.save
      redirect_to @question, notice: 'Questionnaire was successfully created.'
    else
      render :new
    end
  end


  def update
    respond_to do |format|
      if @question.update(questionnaire_params)
        format.html { redirect_to @question, notice: 'Questionnaire was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questionnaires_url, notice: 'Questionnaire was successfully destroyed.' }
    end
  end

  private

  def scope
    current_user.my_questions
  end

  def set_question
    @question = scope.find(params[:id])
  end


  def questionnaire_params
    params.require(:question).permit(:question, :value, answers_attributes: [:id, :answer, :correct, :_destroy])
  end
end
