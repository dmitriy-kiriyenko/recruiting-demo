class CreateFolders < ActiveRecord::Migration[5.0]
  def change
    create_table :folders do |t|
      t.string :name, default: '', null: false

      t.timestamps
    end
  end
end
