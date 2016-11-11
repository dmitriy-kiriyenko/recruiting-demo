class QsetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_qset, only: [:edit, :update, :destroy]
  before_action :get_user_qset, only: [:start, :finish]

  respond_to :html


  def start
    if @uqs.started_at.nil?
      @uqs.started_at = DateTime.now
      @uqs.save
    end
  end

  def finish
    if DateTime.now.to_i - @uqs.started_at.to_i > 60 * 60  # 60 min
      render plain: "Sorry, too late..."
      return
    end
    total_value = 0
    if params[:questions] && params[:questions].keys
      params[:questions].keys.each do |question_id|
        answer = Answer.where(id: params[:questions][question_id]).first
        total_value += answer.question.value if answer && answer.correct?
      end
    end
    render plain: total_value
  end

  def index
    @qsets = Qset.all
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
      redirect_to qsets_path, notice: 'Qset was successfully created.'
    else
      render :new
    end
  end

  def update
    if @qset.update(qset_params)
      set_assigned_models
      redirect_to qsets_path, notice: 'Qset was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @qset.destroy
    redirect_to qsets_url, notice: 'Qset was successfully destroyed.'
  end

  private

  def get_user_qset
    @qset = Qset.find(params[:id])
    @uqs = UserQset.where(user_id: current_user.id, qset_id: @qset.id).first
    raise "Not allowed" unless @uqs
  end


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
