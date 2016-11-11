class Image < ApplicationRecord
  validates :file, presence: true
  belongs_to :folder
  acts_as_taggable_on :labels

  mount_uploader :file, ImageUploader

  def name
    file.file.filename
  end
end
