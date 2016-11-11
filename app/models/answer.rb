class Answer < ApplicationRecord
  belongs_to :question, inverse_of: :answers

  def correct?
    correct > 0
  end

end
