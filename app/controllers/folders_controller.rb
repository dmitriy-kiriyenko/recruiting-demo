class FoldersController < ApplicationController
  before_action :authenticate_user!
  respond_to :html

  def index
    @folders = scope.all
  end

  def show
    @folder = find_folder
  end

  def new
  end

  def create
    @folder = scope.create(folder_params)

    respond_with folder
  end

  def edit
  end

  def update
    @folder = find_folder
    if @folder.update_attributes(folder_params)
      flash[:notice] =  'Folder updated'
    end

    respond_with @folder
  end

  def destroy
    @folder = find_folder
    Folder::Delete.(@folder)
    flash[:notice] = 'Folder removed'

    respond_with @folder
  end

  private

  def scope
    current_user.folders
  end

  def find_folder
    scope.find(params[:id])
  end

  def folder_params
    params.require(:folder).permit(:name)
  end
end
