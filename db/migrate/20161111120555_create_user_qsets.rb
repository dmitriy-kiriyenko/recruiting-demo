class CreateUserQsets < ActiveRecord::Migration[5.0]
  def change
    create_table :user_qsets do |t|
      t.references :user, index: true, null: false
      t.references :qset, index: true, null: false
      t.timestamps
    end
  end
end
