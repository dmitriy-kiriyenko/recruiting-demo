class Qset < ApplicationRecord
  has_many :user_qsets, dependent: :destroy
  has_many :users, through: :user_qsets

  has_many :question_qsets, dependent: :destroy
  has_many :questions, through: :question_qsets

end
