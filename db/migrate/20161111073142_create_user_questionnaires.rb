class CreateUserQuestionnaires < ActiveRecord::Migration[5.0]
  def change
    create_table :user_questionnaires do |t|
      t.references :user, index: true, null: false
      t.references :questionnaire, index: true, null: false
      t.timestamps
    end
  end
end
