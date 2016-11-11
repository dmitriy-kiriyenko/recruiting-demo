class Questionnaire < ApplicationRecord
  has_many :answers, inverse_of: :questionnaire, dependent: :destroy
  accepts_nested_attributes_for :answers, reject_if: proc { |attr| attr['answer'].blank? }, allow_destroy: true

  validates :question, presence: true
  belongs_to :owner, foreign_key: :owner_id, class_name: User
  has_many :user_questionnaires, dependent: :destroy
  has_many :users, through: :user_questionnaires

  validate :must_have_right_answer,  on: [:create , :update]

  default_scope { order("questionnaires.created_at DESC") }

  def must_have_right_answer
    errors.add(:base, "must_have_right_answer") if answers.select{|a| a.correct>0 }.empty?
  end

end
