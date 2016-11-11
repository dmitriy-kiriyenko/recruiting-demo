class CreateQuestionQsets < ActiveRecord::Migration[5.0]
  def change
    create_table :question_qsets do |t|
      t.references :question, index: true, null: false
      t.references :qset, index: true, null: false
      t.timestamps
    end
  end
end
