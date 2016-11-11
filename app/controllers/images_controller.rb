class ImagesController < ApplicationController
  respond_to :html
  helper_method :folder

  def edit
    @image = find_image
  end

  def update
    @image = find_image
    @image.update(image_params)
    respond_with(@image, location: [:edit, folder, @image])
  end

  def create
    @image = folder.images.create(image_params)
    respond_with(@image, location: folder_url(folder))
  end

  def bulk_delete
    folder.images.where(id: Array.wrap(params[:image_ids])).destroy_all

    redirect_to folder_url(folder)
  end

  private

  def folder
    @_folder ||= current_user.folders.find(params[:folder_id])
  end

  def find_image
    folder.images.find params[:id]
  end

  def image_params
    params.require(:image).permit(:file, :label_list)
  end

end
