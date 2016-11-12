class Survey < ActiveRecord::Base
  has_many :recipient_replies

  has_many :questions, dependent: :destroy, inverse_of: :survey
  belongs_to :user

  accepts_nested_attributes_for :questions, reject_if: proc { |attributes| attributes[:content].blank? }

  validates :name, presence: true
  validate :check_questions_number

  private

  def check_questions_number
    if questions.size < 1
      errors.add :base, 'Questions count is invalid!'
    end
  end
end
