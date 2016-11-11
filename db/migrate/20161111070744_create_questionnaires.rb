class CreateQuestionnaires < ActiveRecord::Migration[5.0]
  def change
    enable_extension "hstore"
    create_table :questionnaires do |t|
      t.string  :question
      t.integer :owner_id, null: false
      t.integer :value
      t.timestamps
    end
  end
end
