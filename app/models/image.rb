class Image < ApplicationRecord
  include PublicActivity::Model
  tracked

  has_many :comments, as: :commentable

  belongs_to :folder

  acts_as_taggable_on :labels

  validates :file, presence: true

  mount_uploader :file, ImageUploader

  def name
    file.file.filename
  end
end
