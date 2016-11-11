class Folder < ApplicationRecord
  validates :name, presence: true

  has_many :images, dependent: :destroy

  has_many :rights, dependent: :destroy
  has_many :users, through: :rights
end
