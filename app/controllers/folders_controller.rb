class FoldersController < ApplicationController
  before_action :authenticate_user!
  respond_to :html
  helper_method :folder

  def index
    @folders = scope.all
  end

  def show
  end

  def new
  end

  def create
    respond_with(folder)
  end

  def edit
  end

  def update
    if folder.update_attributes(folder_params)
      flash[:notice] =  'Folder updated'
    end

    respond_with folder
  end

  def destroy
    Folder::Delete.(folder)
    flash[:notice] = 'Folder removed'

    respond_with folder
  end

  private

  def scope
    current_user.folders
  end

  def folder
    @_folder ||= scope.find(params[:id])
  end

  def folder_params
    params.require(:folder).permit(:name)
  end
end
