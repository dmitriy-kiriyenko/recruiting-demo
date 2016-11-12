class Question < ApplicationRecord
  # inverse_of:
  # has_many and nested attributes
  # https://github.com/rails/rails/issues/25198
  has_many :answers, dependent: :destroy, inverse_of: :question

  belongs_to :survey

  accepts_nested_attributes_for :answers, reject_if: proc { |attributes| attributes[:content].blank? }

  validates :weight, numericality: { only_integer: true }
  validates :content, presence: true
  validate :check_answers_number
  validate :check_count_of_correct_answers

  private

  def check_answers_number
    errors.add :base, 'answers count is invalid!' if answers.size < 2
  end

  def check_count_of_correct_answers
    unless answers.select(&:is_correct).one?
      errors.add :base, 'Incorrect count of correct answers!'
    end
  end
end
