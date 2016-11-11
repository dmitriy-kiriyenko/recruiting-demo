class CreateQsets < ActiveRecord::Migration[5.0]
  def change
    create_table :qsets do |t|
      t.integer :owner_id
      t.string :name
      t.timestamps
    end
  end
end
