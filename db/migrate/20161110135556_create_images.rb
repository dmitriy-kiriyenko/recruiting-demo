class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :file, default: '', null: false
      t.references :folder, index: true, null: false

      t.timestamps
    end
  end
end
