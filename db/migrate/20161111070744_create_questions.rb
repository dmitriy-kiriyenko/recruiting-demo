class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
      create_table :questions do |t|
      t.string  :question
      t.integer :owner_id, null: false
      t.references :qset
      t.integer :value
      t.timestamps
    end
  end
end
