class Answer < ApplicationRecord
  belongs_to :questionnaire, inverse_of: :answers
end
