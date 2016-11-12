class RecipientAnswer < ActiveRecord::Base
  belongs_to :recipient_reply

  def self.get_answer_for(question_id)
    recipient_answer = where(question_id: question_id).first
    recipient_answer.try(:answer_id)
  end
end
