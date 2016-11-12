class CreateTableRecipientReply < ActiveRecord::Migration[5.0]
  def change
    create_table :recipient_replies do |t|
      t.references :user
      t.references :survey

      t.integer :owner_id

      t.timestamps
    end
  end
end
