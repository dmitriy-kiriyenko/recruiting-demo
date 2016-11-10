class ImagesController < ApplicationController
  respond_to :html

  def create
    @image = folder.images.create folder_params
    respond_with(@image, location: folder_url(folder))
  end

  def multi_delete
    folder.images.where(id: multi_delete_params[:image_ids]).destroy_all

    redirect_to folder_url(folder)
  end

  private

  def folder
    @_folder ||= current_user.folders.find(params[:folder_id])
  end

  def folder_params
    params.require(:image).permit(:file)
  end

  def multi_delete_params
    params.permit(image_ids: [])
  end
end
