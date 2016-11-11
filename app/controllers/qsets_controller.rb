class QsetsController < ApplicationController
  before_action :set_qset, only: [:show, :edit, :update, :destroy]
  respond_to :html


  def start
    @qset = Qset.find(params[:id])
  end

  def finish
    total_value = 0
    params[:questions].keys.each do |question_id|
      puts "Key #{question_id} ANS ID: #{params[:questions][question_id]}"
      answer = Answer.where(id: params[:questions][question_id]).first
      total_value += answer.question.value if answer && answer.correct?
    end
    render plain: total_value
  end

  def index
    @qsets = Qset.all
  end

  def show
  end

  def new
    @qset = Qset.new
  end

  def edit
  end

  def create
    @qset = Qset.new(qset_params)
    if @qset.save
      set_assigned_models
      redirect_to @qset, notice: 'Qset was successfully created.'
    else
      render :new
    end
  end

  def update
    if @qset.update(qset_params)
      set_assigned_models
      redirect_to @qset, notice: 'Qset was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @qset.destroy
    respond_to do |format|
      format.html { redirect_to qsets_url, notice: 'Qset was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_assigned_models
    @qset.questions = Question.where(id: params[:qset][:questions_ids])
    #@qset.users = User.where(id: params[:questionnaire][:users_ids])
    UserQset.where(qset_id: @qset.id).destroy_all
    users_ids = params[:qset][:users_ids]
    return unless users_ids && users_ids.any?
    users_ids.each do |user_id|
      UserQset.create(user_id: user_id, qset_id: @qset.id) if User.exists?(id: user_id)
    end
  end


  def set_qset
    @qset = Qset.find(params[:id])
  end


  def qset_params
    params.require(:qset).permit(:name)
  end
end
