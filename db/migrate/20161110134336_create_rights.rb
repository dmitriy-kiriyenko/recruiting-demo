class CreateRights < ActiveRecord::Migration[5.0]
  def change
    create_table :rights do |t|
      t.references :user, index: true
      t.references :folder, index: true
      t.timestamps
    end
  end
end
