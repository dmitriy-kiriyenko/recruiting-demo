class RecipientAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :recipient_answers do |t|
      t.references :recipient_reply

      t.integer :question_id
      t.integer :answer_id
    end
  end
end
