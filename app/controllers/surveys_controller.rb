class SurveysController < ApplicationController
  before_action :authenticate_user!

  def index
    @surveys = Survey.all
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(survey_params)

    if @survey.save
      redirect_to @survey, notice: "Successfully created survey."
    else
      render :new
    end
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def update
    @survey = Survey.find(params[:id])
    if @survey.update_attributes(survey_params)
      redirect_to @survey, notice: 'Successfully updated survey.'
    else
      render :edit
    end
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    redirect_to surveys_url, notice: 'Successfully destroyed survey.'
  end

  private
  def set_survey
    @survey = Survey.find(params[:id])
  end

  def survey_params
    params.require(:survey).permit(:name, questions_attributes: [:id, :content, :weight, answers_attributes: [:id, :content, :is_correct]] )
  end
end
