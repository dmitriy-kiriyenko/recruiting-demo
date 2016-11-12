class SurveysController < ApplicationController
  before_action :authenticate_user!

  def index
    @surveys = scope.all
  end

  def show
    @survey = find_survey
  end

  def new
    @survey = scope.build
  end

  def create
    @survey = scope.build(survey_params)

    if @survey.save
      redirect_to @survey, notice: "Successfully created survey."
    else
      render :new
    end
  end

  def edit
    @survey = find_survey
  end

  def update
    @survey = find_survey
    if @survey.update_attributes(survey_params)
      redirect_to @survey, notice: 'Successfully updated survey.'
    else
      render :edit
    end
  end

  def destroy
    @survey = find_survey
    @survey.destroy
    redirect_to surveys_url, notice: 'Successfully destroyed survey.'
  end

  private

  def scope
    current_user.surveys
  end

  def find_survey
    scope.find(params[:id])
  end

  def survey_params
    params.require(:survey).permit(:name, questions_attributes: [:id, :content, :weight, answers_attributes: [:id, :content, :is_correct]] )
  end
end
