class CreateRights < ActiveRecord::Migration[5.0]
  def change
    create_table :rights do |t|
      t.references :user, index: true, null: false
      t.references :folder, index: true, null: false
      t.timestamps
    end
  end
end
