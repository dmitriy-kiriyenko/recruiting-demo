class ImagesController < ApplicationController
  respond_to :html

  def create
    @image = folder.images.create folder_params
    respond_with(@image, location: folder_url(folder))
  end

  private

  def folder
    @_folder ||= current_user.folders.find(params[:folder_id])
  end

  def folder_params
    params.require(:image).permit(:file)
  end
end
