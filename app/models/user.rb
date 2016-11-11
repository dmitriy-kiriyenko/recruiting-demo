class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable

  validates :email, presence: true,
                    uniqueness: { allow_blank: true },
                    format: { with: /\A[^@\s]+@[^@\s]+\z/, allow_blank: true }

  validates :password, presence: true,
                       confirmation: { allow_blank: true }

  has_many :rights, dependent: :destroy
  has_many :folders, through: :rights
  has_many :images, through: :folders

  has_many :my_questions, foreign_key: :owner_id, class_name: Question,  dependent: :destroy

  has_many :user_qsets, dependent: :destroy
  has_many :qsets, through: :user_qsets

  def username
    email.split('@').first
  end
end
