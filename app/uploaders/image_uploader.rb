# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "uploads/folder_#{model.folder_id}/file_#{model.id}"
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg png)
  end

end
