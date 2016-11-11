class AddStartedAtToUserQset < ActiveRecord::Migration[5.0]
  def change
    add_column :user_qsets, :started_at, :datetime
  end
end
