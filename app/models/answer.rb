class Answer < ApplicationRecord
  belongs_to :question, dependent: :destroy, inverse_of: :answers

  validates :content, presence: true
end
