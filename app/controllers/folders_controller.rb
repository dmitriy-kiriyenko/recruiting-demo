class FoldersController < ApplicationController
  before_action :authenticate_user!
  respond_to :html

  def index
    @folders = scope.all
  end

  def new
    @folder = scope.new
  end

  def create
    @folder = scope.create folder_params
    respond_with(@folder)
  end

  def show
    @folder = scope.find(params[:id])
  end

  private

  def scope
    current_user.folders
  end

  def folder_params
    params.require(:folder).permit(:name)
  end
end
