class Folder < ApplicationRecord
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user },
          parameters: { name_was: :name_was }

  validates :name, presence: true

  has_many :images, dependent: :destroy

  has_many :rights, dependent: :destroy
  has_many :users, through: :rights
end
