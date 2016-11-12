class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.integer :survey_id
      t.text :content
      t.integer :weight

      t.timestamps
    end
  end
end
