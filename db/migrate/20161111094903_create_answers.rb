class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.references :questionnaire, index: true, null: false
      t.string  :answer
      t.integer :correct
      t.timestamps
    end
  end
end
