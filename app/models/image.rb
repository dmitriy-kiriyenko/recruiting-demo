class Image < ApplicationRecord
  validates :file, presence: true
  belongs_to :folder

  mount_uploader :file, ImageUploader

  def name
    file.file.filename
  end
end
