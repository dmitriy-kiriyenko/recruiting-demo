class Question < ApplicationRecord
  has_many :answers, inverse_of: :question, dependent: :destroy
  accepts_nested_attributes_for :answers, reject_if: proc { |attr| attr['answer'].blank? }, allow_destroy: true

  validates :question, presence: true

  has_many :question_qsets, dependent: :destroy
  has_many :qsets, through: :user_qsets

  validate :must_have_right_answer,  on: [:create , :update]

  default_scope { order("questions.created_at DESC") }

  def must_have_right_answer
    errors.add(:base, "must_have_right_answer") if answers.select{|a| a.correct? }.empty?
  end

end
