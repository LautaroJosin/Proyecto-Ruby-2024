class RenameStateToIsActiveInUsers < ActiveRecord::Migration[8.0]
  def change
    rename_column :users, :state, :is_active
  end
end
