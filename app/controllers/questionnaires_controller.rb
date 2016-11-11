class QuestionnairesController < ApplicationController
  before_action :set_questionnaire, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :html

  def index
    @questionnaires = scope.all
  end


  def show
  end


  def new
    @questionnaire = Questionnaire.new
    @questionnaire.answers.build
  end


  def edit
    @questionnaire.answers.build
  end


  def create
    @questionnaire = Questionnaire.new(questionnaire_params)
    @questionnaire.owner_id = current_user.id
    if @questionnaire.save
      redirect_to @questionnaire, notice: 'Questionnaire was successfully created.'
    else
      render :new
    end
  end


  def update
    respond_to do |format|
      if @questionnaire.update(questionnaire_params)
        format.html { redirect_to @questionnaire, notice: 'Questionnaire was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    @questionnaire.destroy
    respond_to do |format|
      format.html { redirect_to questionnaires_url, notice: 'Questionnaire was successfully destroyed.' }
    end
  end

  private

  def scope
    current_user.my_questionnaires
  end

  def set_questionnaire
    @questionnaire = scope.find(params[:id]) 
  end


  def questionnaire_params
    params.require(:questionnaire).permit(:question, :value, answers_attributes: [:id, :answer, :correct, :_destroy])
  end
end
